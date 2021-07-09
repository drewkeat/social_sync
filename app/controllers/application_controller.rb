require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret" #?? Fix This
    use Rack::Flash
  end

  get "/" do
    if Helpers.logged_in?(session)
      redirect "/users/account"
    end
    erb :index
  end

  get "/login" do
    if Helpers.logged_in?(session)
      redirect '/users/account'
    end
    @user = User.find_by(email: params[:user][:email])
    
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]= @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message]= "User account not found"
      redirect '/users/new'
    end
  end

  get "/logout" do
    session.clear
    redirect '/'
  end

end
