
module Utils
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