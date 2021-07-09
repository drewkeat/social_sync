class FreetimesController < ApplicationController

  # GET: /freetimes/new
  get "/freetimes/new" do
    if !Helpers.logged_in?(session)
      redirect "/"
    end
    erb :"/freetimes/new.html"
  end

  # POST: /freetimes
  post "/freetimes" do
    @user = Helpers.current_user(session)
    @user.freetimes.build(params[:freetime]).save
    redirect "/users/account"
  end

  # GET: /freetimes/5/edit
  get "/freetimes/:id/edit" do
    @freetime = Freetime.find(params[:id])
    if Helpers.current_user(session) == @freetime.user
      erb :"/freetimes/edit.html"
    else
      redirect "/users/account"
    end
  end

  # PATCH: /freetimes/5
  patch "/freetimes/:id" do
    @freetime = Freetime.find(params[:id])
    @freetime.update(params[:freetime])
    redirect "/users/account"
  end

  # DELETE: /freetimes/5/delete
  delete "/freetimes/:id/delete" do
    @freetime = Freetime.find(params[:id])
    @freetime.destroy
    redirect "/"
  end
end
