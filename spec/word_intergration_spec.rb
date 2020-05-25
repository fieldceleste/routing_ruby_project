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

describe('create a definiton path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    word = Word.new({:term => "Cat", :id => nil})
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition_term', :with => 'A animal')
    click_on('Add Definition')
    # click_on('A animal')
    expect(page).to have_content('A animal')
  end
end

describe('Renames a definiton path', {:type => :feature}) do
  it('Renames an word and then goes to the word page') do
    word = Word.new({:term => "Cat", :id => nil})
    word.save()
    visit("/words/#{word.id}")
    click_on('Edit Word')
    visit("/words/#{word.id}/edit")
    fill_in('term', :with => 'Orange')
    click_on('Update word-(Definition will stay the same')
    expect(page).to have_content('Orange')
  end
end
