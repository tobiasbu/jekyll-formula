require_relative 'utils.rb'

module Jekyll
    module Formula

        module Type
            NONE = 0
            TEXT = 1
            NUMBER = 2
            GROUP = 3
            OPERATOR = 4
            RELATION = 5
            LOGICAL = 6
            SYMBOL = 7
            FUNCTION = 8
            MISC = 9
            ARROW = 10
            COMMAND = 11
        end

        # Represent formula entry
        class Node

            attr_reader :value
            attr_reader :type
            # attr_reader :childs

            def initialize(value = nil, type = Type::NONE)
                @value = value
                @type = type
                @childs = []

                if type == Type::NONE
                    if value.instance_of? String
                        if Utils::is_numeric?(value)
                            @type = Type::NUMBER
                        else
                            @type = Type::TEXT
                        end
                    end
                end
            end
            # Value to string
            def value_s()
                return "#{@value}";
            end

            # Node tree to formated string
            def to_s()
                r = ""
                t = ""

                # the parent node
                case @type
                when Type::NONE then t = ''
                when Type::TEXT then t = 't'
                when Type::NUMBER then t = 'n'
                when Type::OPERATOR then t = 'o'
                end
                r << t << '(' << "#{@value}"

                # childs nodes
               
                if !empty()
                    size = @childs.size
                    for i in 0..size
                        r << @childs[i].to_s()
                        if i < size-1
                            r << ' '
                        end
                    end
                end

                r << ")"
            end

            # children count
            def count()
                return @childs.size
            end

            # has children
            def empty()
                return @childs.empty?
            end

            # add child
            def add(node)
                if (node != nil)
                    @childs << node
                    # or @childs.push(node)
                end
            end

            # get child at
            def get(at)
                return @childs[at]
            end

            # remove node
            def remove(node)
                @childs -= node
                # or @childs.delete(node); 
            end

            # remove node at index
            def remove_at(index)
                @childs.delete_at(index)
            end
        end
    end
end