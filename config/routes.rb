MovieRama::Application.routes.draw do

  resources :movies

  root :to => 'movies#index'
  devise_for :users

  get '/movie/my_movies/', to: 'movies#movies_by_user', as: 'movies_by_user'
  get '/movie/movies_by_date/', to: 'movies#movies_by_date', as: 'movies_by_date'
end
