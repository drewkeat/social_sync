users = [
    "Maria Lawrence",
    "Adelle Warren",
    "Gaynor Windsor",
    "Lisha Ferro",
    "Edison Harlow"
]

user_array = []

users.each do |user|
    email = user.split(" ").map {|name| name.downcase}.join(".") + "@email.com"
    password = user.split(" ").map {|name| name.downcase}.join("")
    user_array << {name: user, email: email, password: password}
end

user_array.each do |user|
    User.create(user)
end

