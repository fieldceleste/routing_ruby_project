require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do
  
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new({:term => "Dog", :id => nil})
    @word.save()
  end

describe('#==') do 
  it("should be able to compare the same definintion if entered twice") do
    definition1 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word.id})
    definition2 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word.id})
      expect(definition1).to(eq(definition2))
    end
  end
  describe('.all') do
    it("returns a list of all defintions") do
      definition1 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:term => "a small domesticated carnivorous mammal with soft fur",:id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end
  describe('.clear') do 
    it("clears all definitions") do
      definition1 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:term => "a small domesticated carnivorous mammal with soft fur",:id => nil, :word_id => @word.id})
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end
  describe('#save') do
    it("saves a definition") do
      definition1 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word.id})
      definition1.save()
      expect(Definition.all).to(eq([definition1]))
    end
  end
  describe('.find') do
    it("finds a definition by id") do
      definition1 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:term => "a small domesticated carnivorous mammal with soft fur",:id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.find(definition1.id)).to(eq(definition1))
    end
  end
  describe('#update') do
    it("updates an definition by id") do
      definition1 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word.id})
      definition1.save()
      definition1.update("a domestic animal that eats meat and is closely related to the wolves")
      expect(definition1.term).to(eq("a domestic animal that eats meat and is closely related to the wolves"))
    end
  end
  describe('#delete') do
    it("deletes an definition by id") do
      definition1 = Definition.new({:term => "a domesticated carnivorous mammal",:id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:term => "a small domesticated carnivorous mammal with soft fur",:id => nil, :word_id => @word.id})
      definition2.save()
      definition1.delete()
      expect(Definition.all).to(eq([definition1]))
    end
  end
end