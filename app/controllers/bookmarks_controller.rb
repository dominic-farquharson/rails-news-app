class BookmarksController < ApplicationController
  
  before_action :ensure_signed_in
  
  def index
    @bookmarks = current_user.bookmarks.order(id: :desc)
  end

  def create
    @bookmark = Bookmark.new(create_bookmark_params)
    @bookmark.user = current_user
    
    if @bookmark.save
      render status: 200, json: { bookmark: @bookmark, success: true }
    else
      errors = @bookmark.errors.full_messages.join(', ')
      render json: {
        errors: errors,
        success: false
      }
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy!
    redirect_to bookmarks_path
  end

  private

  def create_bookmark_params 
    params.require(:bookmark).permit(:title, :link, :note)
  end

end