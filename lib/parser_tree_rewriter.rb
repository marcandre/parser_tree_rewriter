require "parser_tree_rewriter/version"

require 'parser'

if Parser::VERSION <= '2.4.0.2'
  require_relative 'parser_tree_rewriter/messages'
  require_relative 'parser_tree_rewriter/source/buffer'
  require_relative 'parser_tree_rewriter/source/range'
  require_relative 'parser_tree_rewriter/source/tree_rewriter'
  require_relative 'parser_tree_rewriter/source/tree_rewriter/action'
end
