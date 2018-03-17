class NewsController < ApplicationController
  before_action :fetch_news, only: [:index]

  def index
    # placeholder for images that do not exist
    @image_placeholder = 'https://placehold.it/50x50'
    @articles ||= []
  end
end