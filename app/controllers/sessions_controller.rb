class SessionsController < ApplicationController
  before_action :ensure_signed_in, only: [:destroy]
  before_action :ensure_signed_out, only: [:new, :create]
  
  # render sign in form
  def new
    @user = User.new
  end

  # create session
  def create
    username = params[:user][:username]
    password = params[:user][:password]

    user = User.find_from_credentials(username, password)

    if user
      sign_in(user)
      flash[:notice] = "Welcome #{username}"
      redirect_to :root
    else
      flash[:error] = 'Invalid username and / or password'
      # @user = User.new
      redirect_to :login
    end
  end

  # log out
  def destroy
    sign_out
    flash[:notice] = 'You have succesfully signed out.'
    redirect_to :root
  end
end