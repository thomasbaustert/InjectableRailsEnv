$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "injectable_rails_env/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "injectable_rails_env"
  s.version     = InjectableRailsEnv::VERSION
  s.authors     = ["Thomas Baustert"]
  s.email       = ["business@thomasbaustert.de"]
  s.homepage    = ""
  s.summary     = "Allows injecting the Rails env into a class for testing purpose."
  s.description = "Allows injecting the Rails env into a class for testing purpose."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 2.3"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
