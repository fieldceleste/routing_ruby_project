require 'rspec'
require 'word'
require 'pry'
require 'definition'

describe '#Word' do

before(:each) do 
  Word.clear()
end

describe('#Word.all') do 
  it("returns an empty array when there are no words entered") do 
    expect(Word.all).to(eq([]))
   end
  end 
  describe('#term') do 
    it("returns the term of a given word") do 
      word = Word.new({:term =>"Dog", :id => nil})
      expect(word.term()).to(eq("Dog"))
    end
  end
  describe('#save') do
    it("saves a word") do
      word1 = Word.new({:term =>"Cat", :id => nil})
      word1.save()
      word2 = Word.new({:term =>"Hamster", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word1, word2]))
    end
  end
end 
