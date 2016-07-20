# Get started steps
# 1. change password production db yml in local
# 2. cap deploy:setup
# 3. cap deploy:db:setup
# 4. cap deploy:migrations
# 5. clean password yml in local
# 6. config nginx

require "bundler/capistrano" 
require "rvm/capistrano"
set :application, 'spreetgf'
set :user, 'root'
set :domain, '128.199.241.21'
set :port, 22
set :applicationdir, "/var/www/spreetgf"
set :environment, 'production'

set :scm, 'git'
set :repository, "git@github.com:dimpleyuen/spreetgf.git"
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, fetch(:branch, "master")
set :git_shallow_clone, 1
set :scm_verbose, true

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export
set :keep_releases, 5

# rvm
set :rvm_bin_path, "/usr/local/rvm/bin"

# additional settings
# default_run_options[:pty] = true  # Forgo errors when deploying from windows
ssh_options[:forward_agent] = true
#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)            # If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/ public/disp"set :use_sudo, false

# if ruby not installed in different path, check with which ruby
# set :default_environment, {
#   'PATH' => "/usr/local/rvm/rubies/ruby-2.2.0/bin/ruby"
# }

# Setup Shared Folders
#   that should be created inside the shared_path
directory_configuration = %w(db config system)
 
# Setup Symlinks
#   that should be created after each deployment
symlink_configuration = [
  %w(config/database.yml    config/database.yml),
  %w(system                 public/system)
]

# Callbacks
before "deploy:assets:precompile", "setup_symlinks"

# Every deploy runs these commands
after 'deploy:update_code' do
  puts "\n\n=== Running Custom Processes! ===\n\n"
  run "rm -r #{release_path}/public/system"
  run "rm -r #{release_path}/public/spree"
  run "ln -nfs #{deploy_to}/#{shared_dir}/system #{release_path}/public/system"
  run "ln -nfs #{deploy_to}/#{shared_dir}/spree #{release_path}/public/spree" 
  run "ln -nfs #{deploy_to}/#{shared_dir}/ckeditor_assets #{release_path}/public/ckeditor_assets"
  create_production_log
  setup_symlinks
  set_permissions
end

after "deploy:restart", "deploy:cleanup"
after 'deploy:setup', 'deploy:setup_shared_path'

# Magic callback to fix permission tmp in spree
after "deploy:cleanup" do
  set_permissions
end

#
# Manual Tasks
#

desc "Sets permissions for Rails Application"
task :set_permissions do
  puts "\n\n=== Setting Permissions! ===\n\n"
  run "chown -R www-data:www-data #{deploy_to}"
  # run "chown -R nobody #{release_path}"
end

desc "Creates the production log if it does not exist"
task :create_production_log do
  unless File.exist?(File.join(shared_path, 'log', 'production.log'))
    puts "\n\n=== Creating Production Log! ===\n\n"
    run "touch #{File.join(shared_path, 'log', 'production.log')}"
  end
end

desc "Creates symbolic links from shared folder"
task :setup_symlinks do
  puts "\n\n=== Setting up Symbolic Links! ===\n\n"
  symlink_configuration.each do |config|
    run "ln -nfs #{File.join(shared_path, config[0])} #{File.join(release_path, config[1])}"
  end
end

# Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Sets up the shared path"
  task :setup_shared_path do
    puts "\n\n=== Setting up the shared path! ===\n\n"
    directory_configuration.each do |directory|
      run "mkdir -p #{shared_path}/#{directory}"
    end
    system "cap deploy:db:sync_yaml"
  end

  # database
  namespace :db do

    desc "|DarkRecipes| Create MySQL database and user for this environment using prompted values"
    task :setup, :roles => :db, :only => { :primary => true } do
      prepare_for_db_command

      sql = <<-SQL
      CREATE DATABASE #{db_name};
      GRANT ALL PRIVILEGES ON #{db_name}.* TO #{db_user}@localhost IDENTIFIED BY '#{db_pass}';
      SQL

      run "mysql --user=#{db_admin_user} -p --execute=\"#{sql}\"" do |channel, stream, data|
        if data =~ /^Enter password:/
          pass = Capistrano::CLI.password_prompt "Enter database password for '#{db_admin_user}':"
          channel.send_data "#{pass}\n" 
        end
      end
    end

    desc "|DarkRecipes| Create database.yml in shared path with settings for current stage and test env"
    task :create_yaml do      
      set(:db_user) { Capistrano::CLI.ui.ask "Enter #{environment} database username:" }
      set(:db_pass) { Capistrano::CLI.password_prompt "Enter #{environment} database password:" }
      
      db_config = ERB.new <<-EOF
      base: &base
        adapter: mysql2
        encoding: utf8
        username: #{db_user}
        password: #{db_pass}

      #{environment}:
        database: #{application}_#{environment}
        <<: *base

      test:
        database: #{application}_test
        <<: *base
      EOF

      put db_config.result, "#{shared_path}/config/database.yml"
    end

    desc "Syncs the database.yml file from the local machine to the remote machine"
    task :sync_yaml do
      puts "\n\n=== Syncing database yaml to the production server! ===\n\n"
      unless File.exist?("config/database.yml")
        puts "There is no config/database.yml.\n "
        exit
      end
      system "rsync -vr --exclude='.DS_Store' --rsh='ssh -p#{port}' config/database.yml #{user}@#{domain}:#{shared_path}/config/"
    end

    desc "reload the database with seed data"
    task :seed do
      run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
    end
  end
end

def prepare_for_db_command
  set :db_name, "#{application}_#{environment}"
  set(:db_admin_user) { Capistrano::CLI.ui.ask "Username with priviledged database access (to create db):" }
  set(:db_user) { Capistrano::CLI.ui.ask "Enter #{environment} database username:" }
  set(:db_pass) { Capistrano::CLI.password_prompt "Enter #{environment} database password:" }
end