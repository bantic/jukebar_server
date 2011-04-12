class ApplicationController < ActionController::Base
  # protect_from_forgery
  
  protected
  
  def load_user
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    end
    unless @user
      @user = User.create!
      session[:user_id] = @user.id
    end
  end
  
end