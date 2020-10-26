require_relative 'lib/crystal_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "crystal_finder"
  spec.version       = CrystalFinder::VERSION
  spec.authors       = ["ar00gula"]
  spec.email         = ["arianna.mayer@gmail.com"]

  spec.summary       = "A CLI application that scrapes data from a website that sells crystals and presents the information in a way that allows you to browse crystals by meaning."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = "https://github.com/ar00gula/crystal-cli"
  spec.metadata["source_code_uri"] = "https://github.com/ar00gula/crystal-cli"
  spec.metadata["changelog_uri"] = "https://github.com/ar00gula/crystal-cli"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
end
