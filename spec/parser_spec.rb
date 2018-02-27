require_relative '../lib/jekyll-formula.rb'
require_relative '../lib/jekyll-formula/parser.rb'

include Jekyll::Formula

describe Parser do
    def format(txt)
      g = Parser.new
      g.format(txt)
    end

    describe "just a test" do
        it "simple fraction" do
            expect(format("2/3")).to eq("2/3")
        end

    end
end