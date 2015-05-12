require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The app', :type => :feature) do
  describe('the root path') do
    it('visits the index') do
      visit('/')
      expect(page).to have_content('survey')
    end
  end

  describe('create a survey') do
    it('lists the surveys on the index page') do
      visit('/')
      click_link('Add a survey')
      fill_in('name', :with => "Which Dawson's Creek Character are you?")
      click_button('Submit')
      expect(page).to have_content("question")
    end
  end

  describe('add questions') do
    it('allows the user to add questions') do
      visit('/')
      click_link('Add a survey')
      fill_in('name', :with => "Which Dawson's Creek Character are you?")
      click_button('Submit')
      expect(page).to have_content('question')
    end
  end

  describe('take specific survey') do
    it('clicks on a particular survey and goes to the question page') do
      visit('/')
      click_link("Add a survey")
      fill_in("name", :with => "Stuff")
      click_button("Submit")
      fill_in("question", :with => "Stuff")
      fill_in("answer1", :with => "Stuff")
      fill_in("answer2", :with => "Stuff")
      fill_in("answer3", :with => "Stuff")
      fill_in("answer4", :with => "Stuff")
      fill_in("answer5", :with => "Stuff")
      click_button("Submit")
      click_link('Home')
      click_link("Take a survey")
      expect(page).to have_content("Stuff")
    end
  end
end
