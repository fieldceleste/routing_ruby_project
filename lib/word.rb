require 'pry'

class Word 

  attr_reader :id
  attr_accessor :term
  @@words = {}
  @@total_rows = 0

  def initialize (attributes)
    @term = attributes.fetch(:term)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
    Definition.clear()
  end

  def save
    @@words[self.id] = Word.new({:term => self.term, :id => self.id})
  end

  def ==(word_to_compare)
    self.term() == word_to_compare.term()
  end

  def self.find(id)
    @@words[id]
  end

  def update (term)
    @term = term
    @@words[self.id] = Word.new({:term => self.term, :id => self.id})
  end

  def delete()
    @@words.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end


