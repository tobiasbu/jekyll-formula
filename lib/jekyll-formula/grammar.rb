require_relative 'node.rb'
require_relative 'utils'

module Jekyll
    module Formula



      class Grammar

        attr_reader :symbols

        def initialize()
          @greek = Hash.new # {}
          @operators = Hash.new
          @arrows = Hash.new

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


        def check(hash, str)

          substr = nil
          len = -1
          found = nil

          hash.each do |key, value|

            substr = str.slice(/^#{key}/)

            if substr != nil && substr.length > len
              len = substr.length
              found = [key, value, len]
            end

          end

          return found

        end


        def search(str)

          substr = str.slice(/^[a-zA-z]+/)
          node = nil
          found = nil
         
          if substr != nil  # is full word
            # then can be greek or function
            puts str

          else # otherwhise
            
            # check if is operator
            found = check(@operators, str)
            if found != nil

              node = Node.new(found[0], Type::OPERATOR)
            end

          end

          if found != nil
            str.shift(found[2])
          end

          return [str,node]

        end

        def has_symbol(keyword)
          @symbols.has_key?(keyword)
        end
      end

  end
end