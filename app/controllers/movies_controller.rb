# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = case params[:sort].to_s
              when '0'
                Movie.order(created_at: :desc)
              when '1'
                Movie.order(:year)
              when '2'
                Movie.order(year: :DESC)
              else
                pp 'else '
                Movie.order(:created_at)
              end

    pp @movies
    string = @movies.map do |movie|
      render_to_string(partial: 'movies/movie', locals: { movie: movie })
    end.join
    respond_to do |format|
      format.html
      format.json { render json: string }
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    pp '1', params[:q].encoding
    pp '2', 'Ав'.encoding
    @movies = Movie.where('lower(name) like ?', "%#{params[:q].downcase}%")
    # @movies = Movie.where('LOWER(name) LIKE ?', '%ава%')
  end
end
