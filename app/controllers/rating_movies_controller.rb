class RatingMoviesController < ApplicationController
  before_filter :set_rating_movie, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @rating_movies = RatingMovie.all
    respond_with(@rating_movies)
  end

  def show
    respond_with(@rating_movie)
  end

  def new
    @rating_movie = RatingMovie.new
    respond_with(@rating_movie)
  end

  def edit
  end

  def create
    @rating_movie = RatingMovie.new(params[:rating_movie])
    @rating_movie.save
    respond_with(@rating_movie)
  end

  def update
    @rating_movie.update_attributes(params[:rating_movie])
    respond_with(@rating_movie)
  end

  def destroy
    @rating_movie.destroy
    respond_with(@rating_movie)
  end

  def add_rating_like
    session[:return_to] = request.referrer
    movie = Movie.find(params[:movie_id])
    current_user.rated_movies.include?(movie) ? movie.hates -= 1 : current_user.rated_movies << movie
    r_movie = current_user.rating_movies.find_by_movie_id(params[:movie_id])
    # r_movie = add_movie(params[:movie_id])
    r_movie.like = true
    r_movie.hate = false
    r_movie.save
    movie.likes += 1
    movie.save
    redirect_to session.delete(:return_to), :notice => "You LIKED the movie!"
  end

  def add_rating_hate
    session[:return_to] = request.referrer
    movie = Movie.find(params[:movie_id])
    current_user.rated_movies.include?(movie) ? movie.likes -= 1 : current_user.rated_movies << movie
    r_movie = current_user.rating_movies.find_by_movie_id(params[:movie_id])
    # r_movie = add_movie(params[:movie_id])
    r_movie.hate = true
    r_movie.like = false
    r_movie.save
    movie.hates += 1
    movie.save
    redirect_to session.delete(:return_to), :notice => "You HATED the movie!"
  end

  # def add_movie(movie_id)
  #   movie = Movie.find(movie_id)
  #   current_user.rated_movies << movie if !current_user.rated_movies.include?(movie)
  #   r_movie = current_user.rating_movies.find_by_movie_id(params[:movie_id])
  # end

  def remove_like
    session[:return_to] = request.referrer
    movie = Movie.find(params[:movie_id])
    movie.likes -= 1
    movie.save
    current_user.rating_movies.find_by_movie_id(params[:movie_id]).destroy
    redirect_to session.delete(:return_to), :notice => "You do not like the movie any more!"
  end

  def remove_hate
    session[:return_to] = request.referrer
    movie = Movie.find(params[:movie_id])
    movie.hates -= 1
    movie.save
    current_user.rating_movies.find_by_movie_id(params[:movie_id]).destroy
    redirect_to session.delete(:return_to), :notice => "You do not hate the movie any more!"
  end

  private
    def set_rating_movie
      @rating_movie = RatingMovie.find(params[:id])
    end
end
