Rails.application.routes.draw do
  devise_for :users
  get 'new', to: 'games#new'
  post 'score', to: 'games#score'
end
