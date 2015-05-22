require 'test_helper'

class RatingMoviesControllerTest < ActionController::TestCase
  setup do
    @rating_movie = rating_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_movie" do
    assert_difference('RatingMovie.count') do
      post :create, rating_movie: { hate: @rating_movie.hate, like: @rating_movie.like }
    end

    assert_redirected_to rating_movie_path(assigns(:rating_movie))
  end

  test "should show rating_movie" do
    get :show, id: @rating_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_movie
    assert_response :success
  end

  test "should update rating_movie" do
    put :update, id: @rating_movie, rating_movie: { hate: @rating_movie.hate, like: @rating_movie.like }
    assert_redirected_to rating_movie_path(assigns(:rating_movie))
  end

  test "should destroy rating_movie" do
    assert_difference('RatingMovie.count', -1) do
      delete :destroy, id: @rating_movie
    end

    assert_redirected_to rating_movies_path
  end
end
