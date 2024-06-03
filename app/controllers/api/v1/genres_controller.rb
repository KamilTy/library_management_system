# frozen_string_literal: true

module Api
  module V1
    class GenresController < ApplicationController
      before_action :set_genre, only: [:update, :destroy]

      # GET /api/v1/genres
      def index
        genres = Genre.all
        render json: GenreSerializer.new(genres).serializable_hash
      end

      # POST /api/v1/genres
      def create
        genre = Genre.new(genre_params)
        if genre.save
          render json: GenreSerializer.new(genre).serializable_hash, status: :created
        else
          render json: genre.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/genres/:id
      def update
        if @genre.update(genre_params)
          render json: GenreSerializer.new(@genre).serializable_hash
        else
          render json: @genre.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/genres/:id
      def destroy
        @genre.destroy
        head :no_content
      end

      # GET /api/v1/genres/search
      def search
        query = params[:query]
        genres = Genre.where('name LIKE :query', query: "%#{query}%")
        render json: GenreSerializer.new(genres).serializable_hash
      end

      private

      def set_genre
        @genre = Genre.find(params[:id])
      end

      def genre_params
        params.require(:genre).permit(:name)
      end
    end
  end
end
