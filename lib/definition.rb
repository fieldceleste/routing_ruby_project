require 'pry'

class Definition
  attr_reader :id
  attr_accessor :term, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(term, word_id)
    @term = term
    @word_id = word_id
    @id = id || @@total_rows += 1
  end
end