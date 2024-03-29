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
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice]="You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      @user = @user
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
