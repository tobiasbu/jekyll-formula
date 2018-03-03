require_relative '../lib/jekyll-formula.rb'
require_relative '../lib/jekyll-formula/grammar.rb'
require_relative '../lib/jekyll-formula/base-module.rb'
require 'spec_helper'

include Jekyll::Formula

describe Grammar do

    describe "expressions" do
        it "find greek symbol" do
            result = @grammar.find_greek("alpha")
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