require_relative '../lib/jekyll-formula.rb'
require_relative '../lib/jekyll-formula/node.rb'

include Jekyll::Formula

describe Node do

    describe "basic usage" do
        it "get nil node type" do
            n = Node.new
            expect(n.to_s).to eq('()')
        end

        it "get node value" do
            n = Node.new
            expect(n.value).to eq(nil)
        end

        it "get TEXT node type" do
            n = Node.new("blabla")
            expect(n.to_s).to eq("t(blabla)")
        end

        it "adding child node" do
            p = Node.new("parent")
            c = Node.new("child")
            p.add(c)
            expect(p.count).to eq(1)
            expect(p.get(0)).to eq(c)
        end

        it "removing child node" do
            p = Node.new("parent")
            c = Node.new("child")
            p.add(c)
            expect(p.count).to eq(1)
            expect(p.get(0)).to eq(c)

            p.remove_at(0)

            expect(p.count).to eq(0)
            expect(c).not_to eq(nil)
            expect(p.empty).to eq(true)
        end
    end

end