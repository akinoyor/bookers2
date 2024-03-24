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
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book =Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)

  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
