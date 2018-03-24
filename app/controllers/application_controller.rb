class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # sign in user
  def sign_in(user)
    token = SecureRandom.urlsafe_base64 # create random 22 char string
    session[:session_token] = token # store token in session
    user.update_attribute(:session_token, token)

  end

  private

  def fetch_news
    url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=#{ENV['NEWS_API_KEY']}"
    response = HTTParty.get url
    @articles = response.parsed_response['articles'] unless response.code != 200
  end
end
