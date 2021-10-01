# frozen_string_literal: true

require_relative "lib/beyond_the_vale_of_madness/version"

Gem::Specification.new do |spec|
  spec.name          = "beyond_the_vale_of_madness"
  spec.version       = BeyondTheValeOfMadness::VERSION
  spec.authors       = ["Martin Olson"]
  spec.email         = ["martinguyolson@gmail.com"]

  spec.summary       = "Beyond the Vale of madness - T1A3 coder academy assignment"
  spec.description   = "This gem allows you to play through the GURPS fantasy one shot adventure beyond the vale of madness by JC Connors"
  spec.homepage      = "https://github.com/MartinO55/MartinOlson_T1A3/tree/branching-from-known-good#readme"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = "https://github.com/MartinO55/MartinOlson_T1A3/tree/branching-from-known-good"
  spec.metadata["source_code_uri"] = "https://github.com/MartinO55/MartinOlson_T1A3/tree/branching-from-known-good"
  spec.metadata["changelog_uri"] = "https://github.com/MartinO55/MartinOlson_T1A3/tree/branching-from-known-good#readme"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
