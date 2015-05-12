require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload('lib/*.rb')
require('./lib/survey')
require('./lib/question')
require('pg')
require('pry')

get('/') do
  erb(:index)
end
