MovieRama::Application.routes.draw do

  resources :rating_movies


  resources :movies

  root :to => 'movies#index'
  devise_for :users

  get '/my_movies/', to: 'movies#movies_by_user', as: 'movies_by_user'
  get '/movies_by_date/', to: 'movies#movies_by_date', as: 'movies_by_date'
  get '/movies_by_likes/', to: 'movies#movies_by_likes', as: 'movies_by_likes'
  get '/movies_by_hates/', to: 'movies#movies_by_hates', as: 'movies_by_hates'
  get '/filter_by_user/', to: 'movies#filter_by_user', as: 'filter_by_user'
  get '/add_like_rating/', to: 'rating_movies#add_rating_like', as: 'add_rating_like'
  get '/add_hate_rating/', to: 'rating_movies#add_rating_hate', as: 'add_rating_hate'
  get '/remove_like_rating/', to: 'rating_movies#remove_like', as: 'remove_like'
  get '/remove_hate_rating/', to: 'rating_movies#remove_hate', as: 'remove_hate'

end
