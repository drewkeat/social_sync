class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    if !Helpers.logged_in?(session)
      flash[:message] = "You must be logged in to view this page."
      redirect "/"
    end
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end

  get "/users/account" do
    if !Helpers.logged_in?(session)
      flash[:message] = "You must be logged in to view this page."
      redirect "/"
    end
    @user = Helpers.current_user(session)
    erb :"/users/account.html"
  end

  # GET: /users/5
  get "/users/:id" do
    user_page = params[:id].to_i
    if !Helpers.logged_in?(session)
      flash[:message] = "You must be logged in to view this page."
      redirect "/"
    elsif user_page == Helpers.current_user(session).id
      redirect '/users/account'
    else
      @user = User.find(params[:id])
      erb :"/users/show.html"
    end
  end
  

  # GET: /users/5/edit
  get "/users/:id/edit" do
    if !Helpers.logged_in?(session)
      flash[:message] = "You must be logged in to view this page."
      redirect "/"
    end
    @user = Helpers.current_user(session)
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect "/users/#{session[:user_id]}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    @user = Helpers.current_user(session).destroy
    flash[:message] = "Your account has been deleted"
    redirect "/logout"
  end
end
