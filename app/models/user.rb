class User < ActiveRecord::Base
    has_secure_password
    has_many :freetimes

    has_many :friendships, dependent: :destroy  
    has_many :friends, through: :friendships

    def future_freetimes
        self.freetimes.where("start > ?", DateTime.now)
    end

    def befriend(user)
        self.friendships.build(friend_id: user.id)
        user.friendships.build(friend_id: self.id)

        self.save
        user.save
    end

    def find_common_times(friend)
    freetimes = []
        self.freetimes.where("start > ?", DateTime.now).sort_by {|ft| ft.start}.each do |my_ft|
            friend.freetimes.where("start > ?", DateTime.now).sort_by {|ft| ft.start}.each do |friend_ft|
                freetimes << my_ft.match_time(friend_ft)
            end
        end
    end
end
