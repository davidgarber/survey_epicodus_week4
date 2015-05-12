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
  erb(:add_question)
end

get('/take_survey/') do
  @surveys = Survey.all()
  @question = Question.find()
  erb(:take_survey)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch('id'))
  erb(:survey)
end

get('/surveys/:id/add_question') do
  erb(:add_question)
end

post('/surveys/:id/add_question') do
  @surveys = Survey.all()
  survey_id = params.fetch('id')

  question = params.fetch('question')
  answer1 =params.fetch('answer1')
  answer2 =params.fetch('answer2')
  answer3 =params.fetch('answer3')
  answer4 =params.fetch('answer4')
  answer5 =params.fetch('answer5')
  Question.create({:survey_id => survey_id, :question => question, :answer1 => answer1, :answer2 => answer2, :answer3 => answer3, :answer4 => answer4, :answer5 => answer5 })
  erb(:add_question)
end

# get('/surveys/:survey_id/questions/:id') do
#   survey = Survey.find(params.fetch('survey_id'))
#   question = Question.find(params.fetch('id'))
#
# end

get('/question/:id') do
  @questions = Question.all()
  @question = Question.find(params.fetch("id").to_i())
  erb(:question)
end

post('/question/:id') do
  @questions = Question.all()
  @question = Question.find("id".to_i())
  params.fetch
end
