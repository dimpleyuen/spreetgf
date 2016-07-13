# -*- encoding: utf-8 -*-
# stub: premailer 1.8.7 ruby lib

Gem::Specification.new do |s|
  s.name = "premailer"
  s.version = "1.8.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alex Dunae"]
  s.date = "2016-06-28"
  s.description = "Improve the rendering of HTML emails by making CSS inline, converting links and warning about unsupported code."
  s.email = "code@dunae.ca"
  s.executables = ["premailer"]
  s.files = ["bin/premailer"]
  s.homepage = "http://premailer.dialect.ca/"
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.6"
  s.summary = "Preflight for HTML e-mail."

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<css_parser>, [">= 1.4.5"])
      s.add_runtime_dependency(%q<htmlentities>, [">= 4.0.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, ["!= 0.9.0", "~> 0.8"])
      s.add_development_dependency(%q<hpricot>, [">= 0.8.3"])
      s.add_development_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.6"])
      s.add_development_dependency(%q<redcarpet>, ["~> 3.0"])
      s.add_development_dependency(%q<maxitest>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<nokogumbo>, [">= 0"])
    else
      s.add_dependency(%q<css_parser>, [">= 1.4.5"])
      s.add_dependency(%q<htmlentities>, [">= 4.0.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, ["!= 0.9.0", "~> 0.8"])
      s.add_dependency(%q<hpricot>, [">= 0.8.3"])
      s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.6"])
      s.add_dependency(%q<redcarpet>, ["~> 3.0"])
      s.add_dependency(%q<maxitest>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<nokogumbo>, [">= 0"])
    end
  else
    s.add_dependency(%q<css_parser>, [">= 1.4.5"])
    s.add_dependency(%q<htmlentities>, [">= 4.0.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, ["!= 0.9.0", "~> 0.8"])
    s.add_dependency(%q<hpricot>, [">= 0.8.3"])
    s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.6"])
    s.add_dependency(%q<redcarpet>, ["~> 3.0"])
    s.add_dependency(%q<maxitest>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<nokogumbo>, [">= 0"])
  end
end
