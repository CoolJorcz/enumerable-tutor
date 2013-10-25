helpers do
  def authenticated?
    !session[:oauth_token].nil?
  end

  def current_user
    @current_user ||= User.find_by_socrates_id(session[:user_attributes].id)
  end
end
