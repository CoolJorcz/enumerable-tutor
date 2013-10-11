helpers do
  def authenticated?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.new(session[:user_attributes])
  end
end
