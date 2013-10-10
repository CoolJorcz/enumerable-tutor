get '/:id' do
  @challenges = Challenge.order('challenge_order')
  @current_challenge = Challenge.find(params[:id])
  erb :index
end




############ POST ############

post'/:id' do
  @challenge = Challenge.find(params[:id])
  answer = params[:answer]
  @output = eval answer
  if request.xhr?
    erb :_output, layout: false
  end
end
