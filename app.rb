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

get('/add_survey/') do
  @surveys = Survey.all()
  erb(:add_survey)
end

post('/add_survey/') do
  Survey.create(name: params.fetch("name"))
  @surveys = Survey.all()
  @question = @surveys[0]
  erb(:add_question)
end

get('/take_survey/') do
  @surveys = Survey.all()
  @questions = Question.all()
  @question = @questions[0]
  erb(:take_survey)
end

get('/add_question/') do
  erb(:add_question)
end

post('/add_question/') do
  question = params.fetch('question')
  answer1 =params.fetch('answer1')
  answer2 =params.fetch('answer2')
  answer3 =params.fetch('answer3')
  answer4 =params.fetch('answer4')
  answer5 =params.fetch('answer5')
  Question.create({:question => question, :answer1 => answer1, :answer2 => answer2, :answer3 => answer3, :answer4 => answer4, :answer5 => answer5 })
  erb(:add_question)
end


get('/question/:id') do
  @questions = Question.all()
binding.pry
  @question = Question.find("id".to_i())
  erb(:question)
end

post('/question/:id') do
  @questions = Question.all()
  @question = Question.find("id".to_i())
  params.fetch
end
