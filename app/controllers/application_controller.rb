class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def fetch_news
    url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=#{ENV['NEWS_API_KEY']}"
    response = HTTParty.get url
    @articles = response.parsed_response['articles'] unless response.code != 200
  end
end
