# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:favorite]
  before_action :movie, only: [:show]

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
              end.includes(:categories, :favorites).with_attached_image
    string = @movies.map do |movie|
      render_to_string(partial: 'movies/movie', locals: { movie: movie })
    end.join
    respond_to do |format|
      format.html
      format.json { render json: { html: string } }
    end
  end

  def show
    @movie = Movie.includes(:categories, :comments, :favorites, :reviews, players: :image_attachment).find(params[:id])
  end

  def search
    @movies = Movie.where('lower(name) like ?', "%#{params[:q].downcase}%")
  end

  def favorite
    if select = current_user.favorites.find_by(movie_id: movie.id)
      select.destroy
    else
      current_user.movies << movie
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def movie
    @movie ||= Movie.find(params[:id])
  end
end
