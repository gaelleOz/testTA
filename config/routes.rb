Rails.application.routes.draw do
  devise_for :users
  root to: 'parties#new'
  get 'score', to: 'parties#score'
  post 'score', to: 'parties#score'
end
