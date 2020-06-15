# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    @movies = Movie.where('LOWER(name) LIKE ?', "%#{params[:q].downcase}%")
  end
end
