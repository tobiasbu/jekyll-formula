require_relative '../lib/jekyll-formula.rb'
require_relative '../lib/jekyll-formula/parser.rb'
require_relative '../lib/jekyll-formula/grammar.rb/'
require 'spec_helper'


include Jekyll::Formula


describe Parser do

     def parse(txt)
      p = Parser.new(@grammar)
      p.exec(txt)
    end

    describe "parser expressions" do
        it "initial" do
            r = parse("2/3")
            expect(r.to_s()).to eq("(n(2) o(/) n(3))")
        end

        it "spaces" do
            r = parse("   2 /   3    ")
            expect(r.to_s()).to eq("(n(2) o(/) n(3))")
        end
    end
    
end