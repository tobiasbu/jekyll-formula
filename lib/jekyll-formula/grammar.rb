require_relative 'node.rb'


module Jekyll
    module Formula



      class Grammar

        attr_reader :symbols

        def initialize()
          @greek = Hash.new # {}
          @operators = Hash.new
          @arrows = = Hash.new

          # operators
          @operators['/'] = {out: '/'}
          @operators['+'] = {out: '+'}
          
          #arrow
          @arrows['->'] = {out: "\u2192"}

          # greek symbols
          @greek['alpha'] = {out: "\u03B1"}
          @greek['beta'] = {out: "\u03B2"}

        end

        def find_greek(keyword)
          @greek.fetch(keyword, nil)
        end

        def find_operator(keyword)
          @operators.fetch(keyword, nil)
        end

        def find_exp(str)

        end

        def has_symbol(keyword)
          @symbols.has_key?(keyword)
        end
      end

  end
end