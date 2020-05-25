require('capybara/rspec')
require('./app')
require('word.rb')
require 'definition.rb'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word then goes to the word page') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('word_term', :with => 'Dog')
    click_on('Go!')
    expect(page).to have_content('Dog')
  end
end

# describe('create a definiton path', {:type => :feature}) do
#   it('creates an word and then goes to the word page') do
#     word = Word.new("Apple", nil)
#     word.save
#     visit("/words/#{word.id}")
#     fill_in('definition_name', :with => 'A fruit')
#     click_on('Add')
#     expect(page).to have_content('A fruit')
#   end
# end

# describe('Renames a definiton path', {:type => :feature}) do
#   it('Renames an word and then goes to the word page') do
#     word = Word.new("Apple", nil)
#     word.save
#     visit("/words/#{word.id}")
#     click_on('Edit word')
#     visit("/words/#{word.id}/edit")
#     fill_in('name', :with => 'Orange')
#     click_on('Update')
#     expect(page).to have_content('Orange')
#   end
# end
