
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "parser_tree_rewriter/version"

Gem::Specification.new do |spec|
  spec.name          = "parser_tree_rewriter"
  spec.version       = ParserTreeRewriter::VERSION
  spec.authors       = ["Marc-Andre Lafortune"]
  spec.email         = ["github@marc-andre.ca"]

  spec.summary       = %q{Adds Parser::Source::TreeRewriter to parser, until next release}
  spec.description   = %q{Adds Parser::Source::TreeRewriter to parser, until next release}
  spec.homepage      = "https://github.com/marcandre/parser_tree_rewriter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "parser", ">= 2.4.0.2"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
