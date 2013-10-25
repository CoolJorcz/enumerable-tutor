get '/' do
  if authenticated?
    redirect to '/challenges/1'
  else
    erb :welcome
  end
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
  
  erb :index
end

get '/admin' do
  @challenges = Challenge.order('challenge_order')
  erb :admin
end



############ POST ############

post '/challenges' do
  @challenge = Challenge.create(params[:challenge])
  unless params[:method].blank?
    @challenge.hint = Hint.where(method: params[:method]).first_or_create
  end
  
  if @challenge.valid?
  
    redirect to "/admin"
  
  else
    
    erb :edit_challenge
  
  end
end



post'/challenges/:id' do
  @challenges = Challenge.order(:challenge_order)
  @current_challenge = Challenge.find(params[:id])
  
  @user_output = evaluate(params[:answer])
  @attempt = Attempt.create(attempt_text: params[:answer], 
                            passed: @user_output == @current_challenge.expected_output)


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
    challenge.update_column(:challenge_order, new_order.index(challenge.challenge_order.to_s)+1)
  end
end









