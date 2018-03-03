require_relative '../lib/jekyll-formula.rb'
require_relative '../lib/jekyll-formula/grammar.rb'
require_relative '../lib/jekyll-formula/base-module.rb'

include Jekyll::Formula

describe Grammar do
    def find_sym(key)
      g = Grammar.new
      g.find_symbol(key)
    end

    describe "expressions" do
        it "get symbol" do
            result = find_sym("alpha")
            expect(result[:out]).to eq("\u03B1")
        end
    end

    describe "class and module test" do
        it "documentation" do
            #puts Module::doc(Pattern)
        end

        it "documentation" do
            Module::doc(Jekyll::Formula)
        end

    end
end