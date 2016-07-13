# -*- encoding: utf-8 -*-
# stub: truncate_html 0.9.3 ruby lib

Gem::Specification.new do |s|
  s.name = "truncate_html"
  s.version = "0.9.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Harold Gim\u{e9}nez"]
  s.date = "2014-09-19"
  s.description = "Truncates html so you don't have to"
  s.email = ["harold.gimenez@gmail.com"]
  s.homepage = "https://github.com/hgmnz/truncate_html"
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.4.6"
  s.summary = "Uses an API similar to Rails' truncate helper to truncate HTML and close any lingering open tags."

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.13"])
      s.add_development_dependency(%q<rails>, ["~> 3.2.13"])
    else
      s.add_dependency(%q<rspec-rails>, ["~> 2.13"])
      s.add_dependency(%q<rails>, ["~> 3.2.13"])
    end
  else
    s.add_dependency(%q<rspec-rails>, ["~> 2.13"])
    s.add_dependency(%q<rails>, ["~> 3.2.13"])
  end
end
