require_relative '../lib/jekyll-formula/grammar.rb/'

RSpec.configure do |config|
    config.before(:example) {  @grammar = Grammar.new }
end