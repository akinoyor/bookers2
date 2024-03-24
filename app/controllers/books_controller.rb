class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @newbook = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(book.id)
    else
      @user = current_user
      @newbook = book
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
    redirect_to books_path
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      @book = @book
      render :edit
    end
  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
