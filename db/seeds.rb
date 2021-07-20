users = []
5.times {users << Faker::Name.first_name + " " + Faker::Name.last_name}
user_array = []

users.each do |user|
    email = user.split(" ").map {|name| name.downcase}.join(".") + "@email.com"
    password = user.split(" ").map {|name| name.downcase}.join("")
    user_array << {name: user, email: email, password: password}
end

user_array.each do |user|
    User.create(user)
end


