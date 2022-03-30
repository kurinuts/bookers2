Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  
  get 'homes/top'
  get 'homes/about' => 'homes#about', as: "about"
  
  resources :books
  resources :users
  
  # get 'books/new'
  # get 'books/show'
  # get 'books/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
