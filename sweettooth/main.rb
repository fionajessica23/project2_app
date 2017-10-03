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
  @recipes = Recipe.all
  erb :index
end

get '/myrecipe' do
  erb :myrecipe
end

# create new recipe
get '/detail/new' do
  erb :new
end

get '/detail/:id' do
  @recipe = Recipe.find(params[:id])
  erb :detail
end

get '/detail/:id/edit' do
  @recipe = Recipe.find(params[:id])
  erb :edit
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
  redirect "/detail/#{params[:id]}"
end
