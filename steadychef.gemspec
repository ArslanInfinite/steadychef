lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "steadychef/version"

Gem::Specification.new do |spec|
  spec.name          = "steadychef"
  spec.version       = SteadyChef::VERSION
  spec.authors       = ["Arslan Ali"]
  spec.email         = ["ali.arslan319@gmail.com"]

  spec.summary       = %q{CLI app for culinary courses.}
  spec.description   = %q{This app scrapes information from CourseHorse and brings it to the CLI}
  spec.homepage      = "https://github.com/ArslanInfinite/steadychef"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ArslanInfinite/steadychef"
  spec.metadata["changelog_uri"] = "https://github.com/ArslanInfinite/steadychef"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "cli-colorize"

end
