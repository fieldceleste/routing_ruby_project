require 'rspec'
require 'word'
require 'pry'
require 'definition'

describe '#Word' do

before(:each) do 
  Word.clear()
end

describe('.all') do 
  it("returns an empty array when there are no words entered") do 
    expect(Word.all).to(eq([]))
    
   end
  end 
end 
