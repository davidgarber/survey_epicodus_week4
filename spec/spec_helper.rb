ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('capybara/rspec')
require('pg')
require('survey')
require('question')
require('pry')
