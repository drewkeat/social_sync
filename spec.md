# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
>   Social_sync uses the Sinatra WAF to handle controller routing and interactions with ActiveRecord
- [x] Use ActiveRecord for storing information in a database
>   ActiveRecord interacts with models to persist related data.
- [x] Include more than one model class (e.g. User, Post, Category)
>   Social_sync includes models for Users, freetimes, and friendships
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
>   User has many FreeTimes, and has many friends through friendships.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
>   A FreeTime belongs to a User, and a Friendship belongs to two Users
- [x] Include user accounts with unique login attribute (username or email)
>   Users can register and login with name, email and password via the root URL
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
>   Users may update or delete their own profiles from the /users/:i/edit URL
>   Users may create a new FreeTime from the /freetimes/new URL
>   Users may update or delete their own FreeTimes from the /freetimes/:i/edit URL which is accessible via the links next to the Readable instances on their /users/account URL.
- [x] Ensure that users can't modify content created by other users
>   Users may only access their own content due to the logic in the get '/login' route:  
```ruby 
if @user && @user.authenticate(params[:user][:password])  
    session[:user_id]= @user.id  
    redirect "/users/#{@user.id}"  
else  
    flash[:message]= "User account not found"  
    redirect '/users/new'  
end
```

- [x] Include user input validations
>   During account creation, social_sync ensures that a user may not recreate an account with the same email adress.  This block also ensures that all input fields are filled before creating a new user account.
```ruby
if params[:user][:name].empty? || params[:user][:email].empty? || params[:user][:password].empty?
      flash[:message] = "Please complete all fields."
      redirect '/'
    elsif !User.find_by(email: params[:user][:email])
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Account already exists."
      redirect "/"
    end
```
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
>   Sinatra-Flash posts messages related to invalid actions related to the application.
```ruby
    flash[:message]= "User account not found"
    redirect '/users/new'
```
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message