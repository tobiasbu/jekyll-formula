require_relative '../lib/jekyll-formula.rb'
require_relative '../lib/jekyll-formula/pattern.rb'
require_relative '../lib/jekyll-formula/base-module.rb'

include Jekyll::Formula

describe Pattern do
    def format(txt)
      g = Pattern.new
      #g.format(txt)
    end

    describe "class and module test" do
        it "documentation" do
            puts Module::doc(Pattern)
        end

        it "documentation" do
            puts Module::doc(Jekyll::Formula)
        end

    end
end