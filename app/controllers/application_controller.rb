require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret" #?? Fix This
  end

  get "/" do
    erb :welcome
  end

  post "/login" do
    @user = User.find_by(email: params[:user][:email])
    
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]= @user.id
      redirect "/users/#{@user.id}"
    end
    redirect '/users/new'
  end

  get "/logout" do
    session.clear
    redirect '/'
  end
end
