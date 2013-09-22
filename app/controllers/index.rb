get '/' do
  @challenges = [] #give me back challenges sorted by order ascending
  erb :index
end
