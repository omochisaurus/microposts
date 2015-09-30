class UsersController < ApplicationController

  def followings
    @users = current_user.following_users
  end
  
  def followers
    @users = current_user.follower_users
  end
  

  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page]).per(10)
  end
  
  def new
    @user = User.new
  end

  def edit
   @user = User.find(params[:id])
  end   
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end


  def update
       @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user , notice: '情報を編集しました'
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :live, :profile)
  end
end