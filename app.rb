require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload('lib/*.rb')
require('./lib/survey')
require('./lib/question')
require('pg')
require('pry')

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/') do
  Survey.create(name: params.fetch("name"))
  @surveys = Survey.all()
  erb(:index)
end
