require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The app', :type => :feature) do
  describe('the root path') do
    it('visits the index') do
      visit('/')
      expect(page).to have_content('Survey')
    end
  end

  describe('create a survey') do
    it('lists the surveys on the index page') do
      visit('/')
      fill_in('name', :with => "Which Dawson's Creek Character are you?")
      click_button('Submit')
      expect(page).to have_content("Which Dawson's Creek Character")
    end
  end
end
