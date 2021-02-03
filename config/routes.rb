Rails.application.routes.draw do
  root to: 'pages#home'
  get '/about', to: 'pages#about'

  resources :classjoins
  resources :questions do
    resources :answers
  end
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
