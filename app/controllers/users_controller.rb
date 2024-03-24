class UsersController < ApplicationController
  def index
    @newbook =Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find((params[:id]))
    @newbook = Book.new
    @books = Book.where(user_id:params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
