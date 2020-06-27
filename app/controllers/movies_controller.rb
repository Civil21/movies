# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = case params[:sort].to_s
              when 'НЕщодавно додані'
                Movie.order(created_at: :desc)
              when 'Новіші'
                Movie.order(year: :DESC)
              when 'Cтаріші'
                Movie.order(:year)
              else
                Movie.order(:created_at)
              end
    string = @movies.map do |movie|
      render_to_string(partial: 'movies/movie', locals: { movie: movie })
    end.join
    respond_to do |format|
      format.html
      format.json { render json: { html: string } }
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    @movies = Movie.where('lower(name) like ?', "%#{params[:q].downcase}%")
  end
end
