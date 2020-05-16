require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words_homepage)
end

get('/words_homepage') do
  redirect to ('/')
end

get('/words_homepage/new') do
  erb(:new_word)
end

get('/words_homepage/:id') do
  @word = Word.find(params[:id].to_i)
  # @definitions = Definition.find_by_word(@word.id)
  erb(:word_subpage)
end

post('/words_homepage') do
  term = params[:word_term]
  word = Word.new({:term => term, :id => nil})
  word.save()
  @words = Word.all()
  redirect to ('/')
end

get('/words_homepage/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words_homepage/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:term])
  @words = Word.all
  erb(:words_homepage)
end

delete('/words_homepage/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words_homepage)
end

# get('/words_homepage/:id') do 
#   @word = Word.find(params[:id].to_i())
#   @word.sort()
#   @words = Words.all
#   erb(:words_homepage)
# end

# ///-----Definitions---------------------------------------->

get('/words_homepage/:id/definitions/:definition_id') do
  # @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:definition_id].to_i)
  erb(:definition)
end 

post('/words_homapge/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:term => term, :id => nil, :word_id => @word.id})
  definition.save()
  erb(:word_subpage)
end

patch('/words_homepage/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i)
  definition = Definition.find(params[:definition_id].to_i)
  definition.update(params[:term])
  @definitions = Definition.find_by_word(@word.id)
  erb(:word_subpage)
end 

delete('/words_homepage/:id/definitions/:definition_id') do 
  definition = Definition.find_by_word(@word.id)
  definition.delete()
  @word = Word.find(params[:id].to_i)
  definition = Definition.find(params[:definition_id].to_i)
  erb(:word_subpage)
end  