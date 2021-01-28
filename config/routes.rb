Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  resources :posts
  root to: 'pages#home'
  devise_for :users
  resources :classjoins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
