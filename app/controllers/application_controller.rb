class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

  private

  def fetch_news
    url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=#{ENV['NEWS_API_KEY']}"
    response = HTTParty.get url
    @articles = response.parsed_response['articles'] unless response.code != 200
  end
end
