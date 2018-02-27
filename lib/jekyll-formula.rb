require 'liquid'
require "jekyll-formula/version"
require "jekyll-formula/parser"

module Jekyll
  class FormulaBlock < Liquid::Block
    # Your code goes here...
    def initialize(tag_name, text, tokens)
      @parser = Formula::Parser.new
    end

    def render(context)
      @text = super
      @formatted = @parser.format(@text, @brush)

      "<div class='formula'>#{@formatted}</div>"
    end

  end
end

Liquid::Template.register_tag('formula', Jekyll::FormulaBlock)