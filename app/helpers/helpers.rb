require 'sinatra/base'

class Helpers
    def self.current_user(session)
        @user = User.find(session[:user_id])
    end

    def self.logged_in?(session)
        !!session[:user_id]
    end

    def self.time_localize(time_string)
        (time_string + " #{DateTime.now.zone}").to_datetime
    end
end