Rails.application.routes.draw do
  root to: "homes#top"

  devise_for :users, skip: [:sessions]
  as :user do
    get 'users/sign_in', to: 'devise/sessions#new', as: :new_user_session
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    post 'users/sign_in', to: "devise/sessions#create", as: :user_session
  end

  get 'homes/top'
  get 'homes/about' => 'homes#about', as: "about"

  resources :books
  resources :users

  # get 'books/new'
  # get 'books/show'
  # get 'books/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
