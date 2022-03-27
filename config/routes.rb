Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  
  resources :books, only: [:new, :show, :index, :create]
  resources :users, only: [:show, :edit]
  
  # get 'books/new'
  # get 'books/show'
  # get 'books/index'
  get 'homes/top'
  
  get 'homes/about' => 'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
