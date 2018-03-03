
module Utils
    # Check if value is numeric
    def self.is_numeric?(s)
        begin
        Float(s)
        rescue
        false # not numeric
        else
        true # numeric
        end
    end
end

class String


    # Get first n characters
    def first(n = 1)
        self[0...n]
    end

    # Remove first chars by n 
    # Return the shifted value
    def shift(n = 1)
        shifted = first(n)
        self.replace self[n..-1]
        return shifted
    end

    alias_method :shift!, :shift

end