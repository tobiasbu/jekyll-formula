require_relative 'node.rb'
require_relative 'utils.rb'


module Jekyll
  module Formula

    # Read raw input data and parse into nodes
    class Parser

      def initialize(grammar)
        @grammar = grammar
      end

      # Execute parser
      def exec(text)

        # CLEANUP

        # remove leading spaces
        formated = text.strip

        # remove html generated unicodes
        formated = formated.gsub(/&nbsp;/,"");
        formated = formated.gsub(/&gt;/,">");
        formated = formated.gsub(/&lt;/,"<");
        
        # PARSER          
        #return parse_formula(text)
        #return "#{formated}";
        puts "FORMULA: " + formated + "\n"
        
        return parse_formula(formated)
      end

      # Remove blank characters
      def erase_blank(str)
        it = 0
        while it < str.length && str[it].ord <= 32 do
          it += 1
        end
        str = str[it..-1]
        return str
      end

      # Detect expression on the formula
      def detect_exp(str)
        
        node = nil
        exp = str.slice!(/^[0-9]+/)

        if exp != nil # is digit
          node = Node.new(exp)
          str = str.sub(/#{exp}/,"")
        else
          # check if is operator
          exp = @grammar.search(str)
          node = exp[1]
          str = exp[0]
          #if (exp != nil)
          #  exp = exp[:out]
          #  node = Node.new(exp, Type::OPERATOR)
          #end
        end



        return [str, node]

      end

      # Parse math formula
      def parse_formula(formula)

        # create parent node
        parent = Node.new
        current = nil

        loop do
         

          formula = erase_blank(formula)
          puts "f: " + formula + "\n"
          result = detect_exp(formula)
          formula = result[0]
          current = result[1]
          parent.add(current)
         
          break if formula.length == 0 || formula == nil
        end

        return parent

      end



    end

  end
end
  