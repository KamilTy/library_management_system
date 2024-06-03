# frozen_string_literal: true

module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :set_author, only: [:update, :destroy]

      # GET /api/v1/authors
      def index
        authors = Author.all
        render json: AuthorSerializer.new(authors).serializable_hash
      end

      # POST /api/v1/authors
      def create
        author = Author.new(author_params)
        if author.save
          render json: AuthorSerializer.new(author).serializable_hash, status: :created
        else
          render json: author.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/authors/:id
      def update
        if @author.update(author_params)
          render json: AuthorSerializer.new(@author).serializable_hash, status: :created
        else
          render json: @author.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/authors/:id
      def destroy
        @author.destroy
        head :no_content
      end

      # GET /api/v1/authors/search
      def search
        query = params[:query]
        authors = Author.where('name LIKE :query', query: "%#{query}%")
        render json: AuthorSerializer.new(authors).serializable_hash
      end

      private

      def set_author
        @author = Author.find(params[:id])
      end

      def author_params
        params.require(:author).permit(:name)
      end
    end
  end
end
