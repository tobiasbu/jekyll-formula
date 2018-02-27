
# THIS IS JUST A TEST

class Module
    @@docs = Hash.new(nil)

    def doc(str)
    @@docs[self.name] = str.strip
    end

    def Module::doc(aClass)
        # If we're passed a class or module, convert to string
        # ('<=' for classes checks for same class or subtype)
        aClass = aClass.name 
        if aClass.class #<= Module
            @@docs[aClass] ||  "No documentation for #{aClass}"
        end
    end

end
