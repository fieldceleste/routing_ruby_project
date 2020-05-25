require('capybara/rspec')
require('./app')
require('word.rb')
require 'definition.rb'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('create a word path', {:type => :feature}) do
#   it('creates a word then goes to the word page') do
#     visit('/words_homepage')
#     save_and_open_page
#     click_on('Add a new word')
#     fill_in('word_name', :with => 'Dog')
#     click_on('Go!')
#     expect(page).to have_content('Dog')
#   end
# end
