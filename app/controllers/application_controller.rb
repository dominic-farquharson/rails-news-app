class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # make method accessible in view  
  helper_method :current_user 

  private

  # sign in user
  def sign_in(user)
    token = SecureRandom.urlsafe_base64 # create random 22 char string
    session[:session_token] = token # store token in session
    user.update_attribute(:session_token, token)

  end

  # finding user
  def current_user 
    @current_user ||= find_current_user
  end

  def find_current_user 
    token = session[:session_token]
    token && User.find_by(session_token: token)
  end

  def sign_out
    # delete token from session
    session.delete(:session_token)
    # delete token from db
    current_user.update_attribute(:session_token , nil)
  end

  def ensure_signed_in 
    return if current_user
    flash[:error] = 'Please sign in to view this page'
    redirect_to :root
  end

  def ensure_signed_out
    return unless current_user
    flash[:error] = 'You are already logged in'
    redirect_to :root
  end

  def fetch_news
    url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=#{ENV['NEWS_API_KEY']}"
    response = HTTParty.get url
    @articles = response.parsed_response['articles'] unless response.code != 200
  end
end
