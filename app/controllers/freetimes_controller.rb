class FreetimesController < ApplicationController

  # GET: /freetimes
  get "/freetimes" do
    erb :"/freetimes/index.html"
  end

  # GET: /freetimes/new
  get "/freetimes/new" do
    erb :"/freetimes/new.html"
  end

  # POST: /freetimes
  post "/freetimes" do
    @user = Helpers.current_user(session)
    @user.freetimes.build(params[:freetime]).save
    redirect "/users/account"
  end

  # GET: /freetimes/5
  get "/freetimes/:id" do
    erb :"/freetimes/show.html"
  end

  # GET: /freetimes/5/edit
  get "/freetimes/:id/edit" do
    @freetime = Freetime.find(params[:id])
    erb :"/freetimes/edit.html"
  end

  # PATCH: /freetimes/5
  patch "/freetimes/:id" do
    redirect "/freetimes/:id"
  end

  # DELETE: /freetimes/5/delete
  delete "/freetimes/:id/delete" do
    redirect "/freetimes"
  end
end
