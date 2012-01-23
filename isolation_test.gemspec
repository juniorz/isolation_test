$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "isolation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "isolation_test"
  s.version     = Isolation::VERSION
  s.authors     = ["Reinaldo de Souza Junior"]
  s.email       = ["juniorz@gmail.com"]
  s.homepage    = "https://github.com/juniorz/isolation_test"
  s.summary     = "Testing Rails::Engine boot proccess."
  # s.description = "TODO: Description of Isolation."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  s.add_development_dependency "sqlite3"
end
