# _Routing with Ruby - Words_
## _By: Celeste Field_
## Description

_This application will allow a user to enter a word, and add it to a list of words. The user will then be able to click on each word and display the definition of each of them. They can also add, update, or delete the word or definition._

## Setup


* _Clone repository from Github: https://github.com/fieldceleste/routing_ruby_project.git_
* _To display page on Heroku please enter this url: https://mighty-fjord-04162.herokuapp.com_
* _Open the repository folder in the terminal_
* _Install all dependencies_
* _Make sure to check which Ruby version you are running by typing `ruby -v`_
* _Cd the project into the root directory and run `bundle install` in the terminal._
* _Open your text editor of choice._
* _Run any test with `rspec`_
* _Run any script files by running `ruby ruby_script.rb`_

## Known Bugs
_No known bugs at this time_

## Technology

* _Git_
* _GitHub_
* _Ruby_
* _Rspec_
* _Pry_
* _Capybara_

## Specs for Word

|Behavior|Input|Output|
| :-----|:-----|:-----|
| System should display a empty array when there is no words| "" | "There are currently no words to display" | √
| System should return a word to the list when added | "Dog" | "Dog" | √
| System should be able to save that word to the list | "∙ Dog" | "∙ Dog" | √
| System should be able to clear all entered words | "Dog", "Cat" | ""|√
| System should be able to compare the same word if entered twice| "Dog, Dog", | "Word 2"| √
| System should be able to find the entered word by id | "Word1" | "Dog"|√
| System should be able to update a word | "Dog" => "Cat"  | "Cat"|√
| System should be able to delete the word | "" | ""| √
| System should be able to display all entered words | "Dog","Cat" | "Dog","Cat"|√

## Specs for Definition

|Behavior|Input|Output|
| :-----|:-----|:-----|
| System should be able to compare the same definintion if entered twice| "a domesticated carnivorous mammal", "a domesticated carnivorous mammal" | "Definition 2"| √
| System should be able to display all entered definitions | "a domesticated carnivorous mammal","a small domesticated carnivorous mammal with soft fur" | "Definition 1", "Definition 2"|√
|System should be able to clear all entered definitions | "a domesticated carnivorous mammal","a small domesticated carnivorous mammal with soft fur"|""|√
| System should be able to save that definition to the list | "∙ a domesticated carnivorous mammal" | "∙ Dog - a domesticated carnivorous mammal" | √
| System should be able to find the entered definition by id | "Definition1" | "a domesticated carnivorous mammal"|√
| System should be able to update a  definition | "a domesticated carnivorous mammal" => "a domestic animal that eats meat and is closely related to the wolves"  | "Defintion1"|√
| System should be able to delete the definition | "a domesticated carnivorous mammal"| ""| √
| System should be able to find a definition for a word | "Dog"| "a domesticated carnivorous mammal"| √
| System should be able to find a definition that belongs to word | "a domesticated carnivorous mammal"| "Dog"| √



## Legal

#### MIT License

### Copyright (c) 2020 Celeste Field

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.