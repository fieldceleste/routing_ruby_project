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
      word = Word.new({:term =>"Dog"})
      expect(word.term()).to(eq("Dog"))
    end
  end
end 
