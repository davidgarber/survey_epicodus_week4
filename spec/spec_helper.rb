ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('capybara/rspec')
require('pg')
require('survey')
require('question')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each do |survey|
      survey.destroy
    end
  end
end

RSpec.configure do |config|
  config.after(:each) do
    Question.all.each do |question|
      question.destroy
    end
  end
end
