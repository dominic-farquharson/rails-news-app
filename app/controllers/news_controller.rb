class NewsController < ApplicationController
  before_action :fetch_news, only: [:index]

  def index
    render json: @articles
  end
end