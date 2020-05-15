require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do
  
  before(:each) do
    Word.clear()
    Definition.clear()
    @word1 = Word.new({:name => "Dog", :id => nil})
    @word1.save()
  end

describe('#==') do 
  it("should be able to compare the same definintion if entered twice") do
    definintion1 = Definition.new({:term => "a domesticated carnivorous mammal"})
      definintion2 = Definition.new({:term => "a domesticated carnivorous mammal"})
      expect(definintion1).to(eq(definintion2))
    end
  end
end