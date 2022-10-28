class BooksController < ApplicationController

    # get '/books'
    def index
        # binding.pry
        # get all books and store in a books variable
        book = Book.all
        # binding.pry
        # send the books variable as a response to the client
        render json: book, status: :ok
        # if all is well, inform the client of successful response
    end

    # '/books'
    def create
        book = Book.create(book_params)
        render json: book, status: :created

        # Book.create(params:)
    end

    # Get a particular book
    # '/books/:id'
    def show
        book = Book.find(book_params[:id])
        render json: book
    end
    
    # '/books/:id'
    # Update a particular book
    def update
    end

    # '/books/:id'
    # Delete a particular book
    def delete
    end

    private 

    def book_params
        params.permit(:id, :title, :author, :publication_year, :number_of_pages)
    end


end
