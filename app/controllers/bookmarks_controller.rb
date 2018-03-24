class BookmarksController < ApplicationController
  
  before_action :ensure_signed_in
  
  def index
    @bookmarks = current_user.bookmarks
  end

  def create
  end

end