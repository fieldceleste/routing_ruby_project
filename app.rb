require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  redirect to ('/')
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  term = params[:word_term]
  word = Word.new({:term => term, :id => nil})
  word.save()
  redirect to ('/')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find_by_word(@word.id)
  erb(:word)
end

post('/words/:id') do
  @word = Word.find(params[:id].to_i)
  term = params[:definition_term]
  definition = Definition.new({:term => term, :id => nil, :word_id => @word.id})
  definition.save()
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:term])
  @word.save()
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end


# ///-----Definitions---------------------------------------->

get('/words/:id/:definition_id') do
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end 

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:term => params[:definition_term], :id => nil, :word_id => @word.id})
  definition.save()
  erb(:word)
end

patch('/words/:id/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:term])
  definitions = Definition.find_by_word(@word.id)
  erb(:word)
end 

delete('/words/:id/:definition_id') do 
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i)
  definition.delete()
  definition = Definition.find_by_word(@word.id)
  erb(:word)
end  