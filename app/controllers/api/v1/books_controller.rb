# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: [:update, :destroy]

      # GET /api/v1/books
      def index
        books = Book.includes(:authors, :genre, :book_copies).all
        render json: BookSerializer.new(books).serializable_hash
      end

      # POST /api/v1/books
      def create
        binding.pry
        book = Book.new(book_params)
        if book.save
          render json: BookSerializer.new(book).serializable_hash, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/books/:id
      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/books/:id
      def destroy
        @book.destroy
        head :no_content
      end

      # GET /api/v1/books/search
      def search
        query = params[:query]
        books = Book.where('title LIKE :query OR author LIKE :query OR genres.name LIKE :query', query: "%#{query}%")
                    .joins(:genre)
        render json: books
      end

      private

      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:title, :genre_id, :isbn, :total_copies, author_ids: [])
      end
    end
  end
end
