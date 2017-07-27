class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    # book = Book.new(params)
    # redirect_to new
    render :new
  end

  def create
    # your code here\

    book = Book.new(book_params)
    debugger
    if book.save
      redirect_to books_url
    else
    end
  end

  def destroy
    id = params[:id]
    book = Book.find(id)
    book.delete
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
