get '/challenges/new' do
  erb :new_challenge
end

get '/' do
  redirect to '/challenges/1'
end

get '/challenges/:id/edit' do
  @current_challenge = Challenge.find(params[:id])

  erb :edit_challenge
end

get '/challenges/:id' do
  @challenges = Challenge.order('challenge_order')
  @current_challenge = Challenge.find_by_id(params[:id])
  @current_user = User.find_by_id(session[:user_id])
  
  if request.xhr?
    erb :_challenge, layout: false
  else
    erb :index
  end
end




############ POST ############

post '/challenges' do
  new_challenge = Challenge.create(params[:challenge])
  if new_challenge.valid?
    new_challenge.hint = Hint.create(method: params[:method])
    redirect to "/challenges/#{new_challenge.id}"
  else
    redirect to '/challenges/new'
  end
end

post'/challenges/:id' do
  @challenges = Challenge.all
  @current_challenge = Challenge.find(params[:id])
  input = params[:answer]
  p params
  
  begin
    @user_output = eval input
  rescue Exception => e
    @user_output = e.message
  end

  expected_output = eval @current_challenge.expected_output 
  @attempt = Attempt.create(:attempt_text => input, passed: (@user_output == expected_output))


  current_user.attempts << @attempt
  @current_challenge.attempts << @attempt
  
  erb :index
  
end
