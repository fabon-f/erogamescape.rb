# frozen_string_literal: true

require_relative "lib/erogamescape/version"

Gem::Specification.new do |spec|
  spec.name = "erogamescape"
  spec.version = Erogamescape::VERSION
  spec.authors = ["fabon"]
  spec.email = ["syobon.hinata.public@gmail.com"]

  spec.summary = "ErogameScape scraper"
  spec.homepage = "https://github.com/fabon-f/erogamescape.rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.6"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fabon-f/erogamescape.rb"
  spec.metadata["changelog_uri"] = "https://github.com/fabon-f/erogamescape.rb/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    git_files = `git ls-files -z`.split("\x0")
    Dir["README.md", "CHANGELOG.md", "LICENSE", "sig/**/*.rbs", "lib/**/*.rb"].filter { git_files.include?(_1) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "oga", "~> 3.4"
end
