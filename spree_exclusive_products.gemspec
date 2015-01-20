# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_exclusive_products'
  s.version     = '2.4.0'
  s.summary     = 'Show selected variants only to specific users roles'
  s.description = 'With this spree extension you can associate a variant to a role and it will be made available only for users logged with that specific role'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Nebulab'
  s.email     = 'info@nebulab.it'
  s.homepage  = 'https://github.com/nebulab/spree_exclusive_products'

  # s.files       = `git ls-files`.split("\n")
  # s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.4'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rubocop', '~> 0.28'
end
