# Sign Up/Login

get '/' do
  if logged_in? then
    redirect '/homepage'
  else
    erb :"static/index"
  end
end


post '/login' do
  puts "login controller"
  user = User.find_by_email(params[:user][:email])
  password = params[:user][:password]
  email = params[:user][:email]
  password_auth = BCrypt::Password.new(user.password_digest)

  if password_auth != password
    redirect '/homepage'
  else
    session[:user_id] = user.id
    redirect '/homepage'

  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/signup' do
  puts "sign up controller"
  user = User.new(params[:user])
  if user.save
    puts "user registered"
    session[:user_id] = user.id
    redirect '/homepage'
  else
    redirect '/'
  end
end

# Homepage
get '/homepage' do
  @tweets = Tweet.all
  puts "current user id: #{session[:user_id]}"
  logged_in_redirect(:"static/homepage", "/")
end
