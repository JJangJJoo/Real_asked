require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require './model.rb' #Database관련 파일(model)

set :bind, '0.0.0.0'

enable :sessions #내가 앱에서 세션을 활용할거야

get '/' do
  @questions = Question.all.reverse
  erb :index
end


get '/ask' do
  Question.create(
    :name => params["name"],
    :content => params["question"]
  )
  redirect to '/'
end


get '/signup' do
    erb :signup
end


get '/register' do
  Member.create(
    :email => params["email"],
    :password => params["password"]
  )
  redirect to '/'
end

get '/admin' do
  @members = Member.all
  erb :admin
end


get '/login' do
  erb :login
end


get '/login_session' do
  if Member.first(:email => params["email"])
      if Member.first(:email => params["email"]).password == params["password"]
      session[:email] = params["email"]
      @message = "로그인 되었습니다."
    else
      @message = "비번이 틀렸습니다."
    end
    else
      @message = "해당하는 이메일의 유저가 없습니다."
    end
end

get '/logout' do
  session.clear
  redirect to '/'
end
