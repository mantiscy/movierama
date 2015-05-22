class MoviesController < ApplicationController
  # GET /movies
  # GET /movies.json

  @@user_movies = false
  # @@user = current_user
  def index
    @movies = Movie.all
    @@user_movies = false
    @@user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])
    @movie.user = current_user
    @movie.likes = 0
    @movie.hates = 0

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  def movies_by_user
    @movies = current_user.movies
    @@user_movies = true
    @@user = current_user

    respond_to do |format|
      format.html { render :template => "movies/index" }
      format.json { render json: @movies }
    end
  end

  def filter_by_user
    usr = User.find(params[:user_id])
    @movies = usr.movies
    @@user_movies = true
    @@user = usr

    respond_to do |format|
      format.html { render :template => "movies/index" }
      format.json { render json: @movies }
    end

  end

  def movies_by_date
    if @@user_movies
      @movies = @@user.movies.order('created_at DESC').all
    else
      @movies = Movie.order('created_at DESC').all
    end

    respond_to do |format|
      format.html { render :template => "movies/index" }
      format.json { render json: @movies }
    end
  end

  def movies_by_likes
    if @@user_movies
      @movies = @@user.movies.order('likes DESC').all
    else
      @movies = Movie.order('likes DESC').all
    end

    respond_to do |format|
      format.html { render :template => "movies/index" }
      format.json { render json: @movies }
    end
  end

  def movies_by_hates
    if @@user_movies
      @movies = @@user.movies.order('hates DESC').all
    else
      @movies = Movie.order('hates DESC').all
    end

    respond_to do |format|
      format.html { render :template => "movies/index" }
      format.json { render json: @movies }
    end
  end

end
