class FreetimesController < ApplicationController
  
  # GET: /freetimes/new
  get "/freetimes/new" do
    if !Helpers.logged_in?(session)
      flash[:message] = "You must be logged in to view this page."
      redirect "/"
    end
    erb :"/freetimes/new.html"
  end

  # POST: /freetimes
  post "/freetimes" do
    @user = Helpers.current_user(session)
    if (params[:freetime][:start].to_date != params[:freetime][:end].to_date) || params[:freetime][:start] >= params[:freetime][:end]
      flash[:message]="Free Time must occur on the same day and end after start time."
      redirect '/freetimes/new'
    end
    @user.freetimes.build(start: Helpers.time_localize(params[:freetime][:start]), end: Helpers.time_localize(params[:freetime][:end])).save
    flash[:message] = "Yay! More Free Time!"
    redirect "/users/account"
  end

  post "/freetimes/common" do
    @friendship = Helpers.current_user(session).friendships.where("friend_id = ?", params[:friend_id]).first
    @common_times = @friendship.find_common_times
    if @common_times.empty?
      flash[:message] = "No common times found"
    else
      flash[:message] = "Common Times: <br> #{@common_times.join("<br>")}"
    end
    
    redirect '/users/account'
  end

  # GET: /freetimes/5/edit
  get "/freetimes/:id/edit" do
    @freetime = Freetime.find(params[:id])
    if Helpers.current_user(session) == @freetime.user
      erb :"/freetimes/edit.html"
    else
      flash[:message] = "You can only update your own Free Times"
      redirect "/users/account"
    end
  end

  # PATCH: /freetimes/5
  patch "/freetimes/:id" do
    @freetime = Freetime.find(params[:id])
    @freetime.update(start: Helpers.time_localize(params[:freetime][:start]), end: Helpers.time_localize(params[:freetime][:end]))
    flash[:message] = "Availability updated"
    redirect "/users/account"
  end

  # DELETE: /freetimes/5/delete
  delete "/freetimes/:id/delete" do
    @freetime = Freetime.find(params[:id])
    @freetime.destroy
    flash[:message] = "Oh no!  You have less freetime."
    redirect "/users/account"
  end
end
