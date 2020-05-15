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
  end
end


