require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do
  
  before(:each) do
    Word.clear()
    Definition.clear()
    @word1 = Word.new({:term => "Dog", :id => nil})
    @word1.save()
  end

describe('#==') do 
  it("should be able to compare the same definintion if entered twice") do
    definition1 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word1.id})
    definition2 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word1.id})
      expect(definition1).to(eq(definition2))
    end
  end
end