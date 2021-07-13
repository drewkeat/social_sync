class User < ActiveRecord::Base
    has_secure_password
    has_many :freetimes

    has_many :friendships, dependent: :destroy  
    has_many :friends, through: :friendships

    def befriend(user)
        self.friendships.build(friend_id: user.id)
        user.friendships.build(friend_id: self.id)

        self.save
        user.save
    end
end
