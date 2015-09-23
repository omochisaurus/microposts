class UsersController < ApplicationController

  def followings
    @user = current_user.following_relationships.find(params[:followings_id]).followings  
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
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