class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    flash[:message] = "User account not found"
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end

  get "/users/account" do
    @user = Helpers.current_user(session)
    erb :"/users/account.html"
  end

  # GET: /users/5
  get "/users/:id" do
    user_page = params[:id].to_i
    if !Helpers.logged_in?(session)
      redirect '/'
    elsif user_page == Helpers.current_user(session).id
      redirect '/users/account'
    else
      @user = User.find(params[:id])
      erb :"/users/show.html"
    end
  end
  

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
