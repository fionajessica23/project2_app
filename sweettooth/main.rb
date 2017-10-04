require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'db_config'
require_relative 'models/recipe'
require_relative 'models/user'
require_relative 'models/category'
require_relative 'models/like'

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end
end

get '/' do
  @categories = Category.all
  erb :index
end

get '/detail/:id/edit' do
  @recipe = Recipe.find(params[:id])
  erb :edit
end

get '/detail/new' do
  erb :new
end

get '/detail/:id' do
  @recipe = Recipe.find_by(id: params[:id])
  erb :detail
end

get '/myrecipe' do
  @recipes = Recipe.where(user_id: session[:user_id])
  erb :myrecipe
end

get '/category/:id' do
  @recipes = Recipe.where(category_id: params[:id])
  erb :category
end

post '/myrecipe' do
  recipe = Recipe.new
  recipe.title = params[:title]
  recipe.image = params[:image]
  # recipe.category = params[:category]
  recipe.prep_time = params[:prep_time]
  recipe.difficulty = params[:difficulty]
  recipe.serving = params[:serving]
  recipe.content = params[:content]
  recipe.save
  redirect '/myrecipe'
end

put '/detail/:id' do
  recipe = Recipe.find(params[:id])
  recipe.title = params[:title]
  recipe.image = params[:image]
  # recipe.category = params[:category]
  recipe.prep_time = params[:prep_time]
  recipe.difficulty = params[:difficulty]
  recipe.serving = params[:serving]
  recipe.content = params[:content]
  recipe.save
  redirect '/myrecipe'
end

delete '/detail/:id' do
  recipe = Recipe.find(params[:id])
  recipe.destroy
  redirect '/myrecipe'
end

# ====================================================
# login and creating session
get '/login' do
  erb :login
end

post '/session' do
  # find the user
  user = User.find_by(email: params[:email])
  #if found a user, and password is matched
  if user && user.authenticate(params[:password])
    # successful, create session then redirect
    # session = {}, session is an empty hash atm
    session[:user_id] = user.id
    redirect '/'
  else
    # don't redirect because we don't want to create a session for this
    @message = 'incorrect email or password'
    erb :login
  end
end


get '/logout' do
  if logged_in?
    session[:user_id] = nil
  end
  redirect '/login'
end

# ====================================================
# creating new account

post '/register' do
  user = User.new
  user.name = params[:name]
  user.email = params[:email]
  user.password = params[:password]
  user.save

  user = User.find_by(email: params[:email])
  #if found a user, and password is matched
  if user && user.authenticate(params[:password])
    # successful, create session then redirect
    # session = {}, session is an empty hash atm
    session[:user_id] = user.id
    redirect '/'
  end
end
