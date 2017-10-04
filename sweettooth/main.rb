require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'
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

  def if_not_logged_in_redirect_to_404
    if !logged_in?
      redirect '/page404'
    end
  end
end

get '/page404' do
  erb :page404
end

get '/' do
  @categories = Category.all
  erb :index
end

get '/recipe/edit/:id' do
  if_not_logged_in_redirect_to_404
  @recipe = Recipe.find(params[:id])
  @categories = Category.all
  erb :recipeedit
end

get '/recipe/add' do
  if_not_logged_in_redirect_to_404
  @categories = Category.all
  erb :recipeadd
end

get '/recipe/:id' do
  @recipe = Recipe.find_by(id: params[:id])
  erb :recipe
end

get '/myrecipe' do
  if_not_logged_in_redirect_to_404
  @recipes = Recipe.where(user_id: session[:user_id])
  erb :myrecipe
end

get '/category/:id/recipe' do
  @recipes = Recipe.where(category_id: params[:id])
  erb :categoryrecipe
end

post '/recipe' do
  if_not_logged_in_redirect_to_404
  recipe = Recipe.new
  recipe.title = params[:title]
  recipe.image = params[:image]
  recipe.category_id = params[:category_id].to_i
  recipe.prep_time = params[:prep_time]
  recipe.difficulty = params[:difficulty]
  recipe.serving = params[:serving]
  recipe.content = params[:content]
  recipe.user_id = session[:user_id].to_i

  if !recipe.save
    flash[:error] = 'Unable to add recipe, please try again'
    redirect '/recipe/add'
  end
  redirect '/myrecipe'
end

put '/recipe/:id' do
  if_not_logged_in_redirect_to_404
  recipe = Recipe.find(params[:id])
  recipe.title = params[:title]
  recipe.image = params[:image]
  recipe.category_id = params[:category_id].to_i
  recipe.prep_time = params[:prep_time]
  recipe.difficulty = params[:difficulty]
  recipe.serving = params[:serving]
  recipe.content = params[:content]
  recipe.user_id = session[:user_id].to_i

  if !recipe.save
    flash[:error] = 'Unable to edit recipe, please try again'
    redirect "/recipe/edit/#{params[:id]}"
  end
  redirect '/myrecipe'
end

delete '/recipe/:id' do
  if_not_logged_in_redirect_to_404
  recipe = Recipe.find(params[:id])
  recipe.destroy
  redirect '/myrecipe'
end

# ====================================================
# login and creating session
get '/login' do
  erb :login
end

post '/login' do
  # find the user
  user = User.find_by(email: params[:email])
  #if found a user, and password is matched
  if user && user.authenticate(params[:password])
    # successful, create session then redirect
    # session = {}, session is an empty hash atm
    flash[:error] = ''
    session[:user_id] = user.id
    redirect '/'
  else
    # don't redirect because we don't want to create a session for this
    flash[:error] = 'Incorrect email or password'
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
  if params[:password] != params[:confirmPassword]
    flash[:error] = 'Password does not matched'
    redirect '/login'
  end
  if !user.save
    flash[:error] = 'Unable to create user account, please try again'
    redirect '/login'
  end

  user = User.find_by(email: params[:email])
  #if found a user, and password is matched
  if user && user.authenticate(params[:password])
    # successful, create session then redirect
    # session = {}, session is an empty hash atm
    session[:user_id] = user.id
    redirect '/'
  end
end
