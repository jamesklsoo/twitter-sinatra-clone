# Tweet
get '/tweet/:id' do
  @tweet = Tweet.find(params[:id])
  logged_in_redirect(:"static/tweet/tweet", '/')
end

post '/tweet/new' do
  tweet_new = Tweet.new(subject: params[:tweet][:subject])
  tweet_new.user = current_user
  tweet_new.save
  redirect '/'
end

post '/tweet/:id/edit' do
  tweet = Tweet.find(params[:id])
  tweet.subject = params[:tweet][:subject]
  tweet.save
  # redirect '/tweet/'+params[:id]
  logged_in_redirect('/tweet/'+params[:id], '/')
end


post '/tweet/:id/delete' do
  Tweet.destroy(params[:id])
  redirect '/homepage'
end
