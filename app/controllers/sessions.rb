enable :sessions

use OmniAuth::Builder do
  provider :dbc, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET']
end

get '/sign_in' do
  redirect to ('/auth/dbc')
end

get '/test_login' do
  erb :login_form
end

post '/test_login' do
  p params
  @user = User.find_by_email(params[:email])
  session[:user_id] = @user.id
  session[:user_attributes] = @user.attributes
  redirect to '/challenges'
end

get '/auth/:provider/callback' do
  user_attributes = request.env['omniauth.auth'].info
  puts user_attributes
  session[:user_attributes] = user_attributes
  token = request.env['omniauth.auth'].credentials
  user = User.from_auth(user_attributes)
  session[:oauth_token] = token_as_hash(token)
  redirect to ('/')
end

get '/sign_out' do
  session.clear
  redirect to ('/')
end
