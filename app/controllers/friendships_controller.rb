class FriendshipsController < ApplicationController

  # GET: /friendships
  get "/friendships" do
    erb :"/friendships/index.html"
  end

  # GET: /friendships/new
  get "/friendships/new/:id" do
    Helpers.current_user(session).befriend(User.find(params[:id]))
    redirect "/users/#{params[:id]}"
  end

  # POST: /friendships
  post "/friendships" do
    redirect "/friendships"
  end

  # GET: /friendships/5
  get "/friendships/:id" do
    erb :"/friendships/show.html"
  end

  # GET: /friendships/5/edit
  get "/friendships/:id/edit" do
    erb :"/friendships/edit.html"
  end

  # PATCH: /friendships/5
  patch "/friendships/:id" do
    redirect "/friendships/:id"
  end

  # DELETE: /friendships/5/delete
  delete "/friendships/:id/delete" do
    redirect "/friendships"
  end
end
