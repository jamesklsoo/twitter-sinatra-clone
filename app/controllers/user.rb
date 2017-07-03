# User
get '/user/:id' do
  @user = User.find(params["id"])
  @follower = Follower.where(user_id_followed: params[:id])
  @following = Follower.where(user_id_following: params[:id])
  @tweet = @user.tweets
  # @show_user_detail = @follower.where(user_id_following: current_user.id).count == 0

  @show = @user.show_detail?(@follower, current_user)
  logged_in_redirect(:"static/user/profile", '/')
end

post '/user/:id/edit' do
  user = User.find(params[:id])
  user.name = params[:user][:name]
  user.password = params[:user][:password]
  user.email = params[:user][:email]
  user.save
  # redirect '/user/'+params[:id]
  logged_in_redirect('/user/'+params[:id], '/')
end

post '/user/:id/follow' do
  follow = Follower.new(user_id_following: params[:follower][:user_id_following], user_id_followed: params[:follower][:user_id_followed])
  follow.save
  # redirect '/user/'+params[:id]
  logged_in_redirect('/user/'+params[:id], '/')
end

get '/user/:id/tweets' do
  @tweets = Tweet.where(user_id: params[:id])
  logged_in_redirect(:"static/user/user_tweet", '/')
end
