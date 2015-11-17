# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lista_enlazada/version'

Gem::Specification.new do |spec|
  spec.name          = "lista_enlazada"
  spec.version       = ListaEnlazada::VERSION
  spec.authors       = ["Kevin"]
  spec.email         = ["alu0100789461@ull.edu.es"]

  spec.summary       = %q{Gema de la practica 08}
  spec.description   = %q{Practica 08}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.11"
end
