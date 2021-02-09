Rails.application.routes.draw do
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/faqs', to: 'pages#faqs'

  resources :classjoins
  resources :assignments do
    resources :attachfiles
    resources :discussions
  end
  resources :questions do
    resources :answers
  end
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
