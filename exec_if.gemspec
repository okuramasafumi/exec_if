
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "exec_if/version"

Gem::Specification.new do |spec|
  spec.name          = "exec_if"
  spec.version       = ExecIf::VERSION
  spec.authors       = ["OKURA Masafumi"]
  spec.email         = ["masafumi.o1988@gmail.com"]

  spec.summary       = %q{Experimental gem to implement `exec_if`}
  spec.description   = %q{Experimental gem to implement `exec_if`}
  spec.homepage      = "https://github.com/okuramasafumi/exec_if"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
