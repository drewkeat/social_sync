class Friendship < ActiveRecord::Base
    belongs_to :user
    belongs_to :friend, class_name: "User"

    def find_common_times
        freetimes = []
        self.user.future_freetimes.each do |user_ft|
            self.friend.future_freetimes.each do |friend_ft|
                freetimes << user_ft.match_time(friend_ft)
            end
        end
        freetimes.compact.map {|time| time.label}
    end
end
