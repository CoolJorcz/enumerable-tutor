get '/' do
  @challenges = Challenge.order('challenge_order')
  erb :index
end



############ POST ############

post '/challenge/:challenge_id' do
  @challenge = Challenge.find(params[:challenge_id])
  answer = Attempt.create(answer_text: params[:answer])
  @user = current_user
  if  answer == passed?
    redirect_to "/challenge/#{@challenge.order + 1}"
  end
end
