require 'pry'

class Definition

  attr_reader :id
  attr_accessor :term, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @term = attributes.fetch(:term)
    @id = attributes.fetch(:id) || @@total_rows += 1
    @word_id = attributes.fetch(:word_id) 
  end

  def ==(definition_to_compare)
    (self.term() == definition_to_compare.term()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values()
  end

  def self.clear
    @@definitions = {}
  end

  def save 
    @@definitions[self.id] = Definition.new({ :term => self.term, :id => self.id, :word_id => self.word_id})
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(term)
    @term = term
    @@definitions[self.id] = Definition.new({:term=> self.term, :id => self.id, :word_id => self.word_id})
  end

  def delete 
    @@definitions.delete(self.id)
  end

  def self.find_by_word(wrd_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == wrd_id
        definitions.push(definition)
      end
    end
    definitions
 end

 def word
  Word.find(self.word_id)
 end 
end