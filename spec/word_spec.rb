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
    it("saves multiple words") do
      word = Word.new({:term => "Dog", :id => nil})
      word.save()
      word2 = Word.new({:term => "Cat", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all entered words") do
      word = Word.new({:term =>"Cat", :id => nil})
      word.save()
      word2 = Word.new({:term =>"Hamster", :id => nil})
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("should compare two words if they are the same") do 
      word = Word.new({:term => "Dog",:id => nil})
      word = Word.new({:term => "Dog",:id => nil})
      expect(word).to(eq(word))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new({:term => "Dog", :id => nil})
      word.save()
      word2 = Word.new({:term => "Cat", :id => nil})
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new({:term => "Dog", :id => nil})
      word.save()
      word.update("Puppies")
      expect(word.term).to(eq("Puppies"))
    end
  end
  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new({:term => "Dog", :id => nil})
      word.save()
      word2 = Word.new({:term => "Cat", :id => nil})
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
  describe('#Word.all') do 
    it("returns all entered words") do 
      word = Word.new({:term => "Dog", :id => nil})
      word.save()
      word2 = Word.new({:term => "Cat", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end
end 
