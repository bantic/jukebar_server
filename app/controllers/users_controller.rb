class UsersController < ApplicationController
  before_filter :load_user
  
  def edit
  end
  
  def update
    @user.attributes = params[:user]
    if @user.save
      redirect_to(:controller => "bars", :action => "show", :id => session[:return_bar_id])
    else
      flash.now[:error] = true
      render :action => "edit"
    end
  end
end
