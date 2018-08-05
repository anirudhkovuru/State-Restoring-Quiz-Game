class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
    unless session[:user_id] == @user.id
      flash.now[:danger] = "You can't do that"
      if logged_in?
        @user = User.find(session[:user_id])
        redirect_to @user
      else
        redirect_to login_path
      end
      return
    end
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Quiz!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
