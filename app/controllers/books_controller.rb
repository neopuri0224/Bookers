class BooksController < ApplicationController
  def top
  end

  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	if book.save
  	  flash[:notice] = "投稿を作成しました"
  	  redirect_to book_path(book)
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
  	redirect_to book_path(book)
  end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :category)
  end
end
