
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-formula/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-formula"
  spec.version       = Jekyll::Formula::VERSION
  spec.authors       = ["Tobias Ulrich"]
  spec.email         = ["flamenco.bluegrass@gmail.com"]
  
  spec.summary       = %q{A simple jekyll plugin for math formula formatting display}
  spec.description   = %q{jekyll-formula helps to displays math formulas with minimal formatting}
  spec.homepage      = "http://github.com/tobiasbu/jekyll-formula"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "rake", "~> 12"
end
