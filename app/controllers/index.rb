get '/' do
  redirect to '/challenges/1'
end


get '/challenges/new' do
  erb :new_challenge
end

get '/challenges/:id/edit' do
  @challenge = Challenge.find(params[:id])

  erb :edit_challenge
end



get '/challenges/:id' do
  @challenges = Challenge.order('challenge_order')
  @current_challenge = Challenge.find_by_id(params[:id])
  @current_user = User.find_by_id(session[:user_id])
  
  erb :index
end

get '/admin' do
  @challenges = Challenge.order('challenge_order')
  erb :admin
end



############ POST ############

post '/challenges' do
  @challenge = Challenge.create(params[:challenge])
  @challenge.hint = Hint.create(method: params[:method]) unless params[:method].blank?
  
  if @challenge.valid?
  
    redirect to "/admin"
  
  else
    
    erb :edit_challenge
  
  end
end



post'/challenges/:id' do
  @challenges = Challenge.all
  @current_challenge = Challenge.find(params[:id])
  input = params[:answer]
  
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


post '/challenges/:id/edit' do
  @challenge = Challenge.find(params[:id])
  
  @challenge.update_attributes(params[:challenge])

  @challenge.hint = Hint.create(method: params[:method]) unless params[:method].blank?

  if @challenge.valid?
  
    redirect to "/admin"
  
  else
    
    erb :edit_challenge
  
  end
end

post '/challenge_order' do
  new_order = params[:challenge_order]
  Challenge.order(:challenge_order).each do |challenge|
    challenge.update_attributes(:challenge_order => new_order.index(challenge.challenge_order.to_s)+1)
  end
end









