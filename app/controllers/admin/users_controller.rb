class Admin::UsersController < AdminController
  def index
    @users = User.all
  end
  
  def add_credits
    @user = User.find(params[:id])
    @user.add_credits(params[:credits].to_i) if params[:credits]
    redirect_to admin_users_path, :notice => "Added #{params[:credits].to_i} credit(s) to #{@user.name}"
  end
end