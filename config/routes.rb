Rails.application.routes.draw do

  root 'home#index'

  resources :phone_numbers, only: [:new, :create]
  post 'phone_numbers/verify' => 'phone_numbers#verify'

  mount ActionCable.server => '/cable'

  resources :messages, only: [:create]

  resources :chats, only: [:index, :show, :new, :create]
  post '/chats/validate_username', to: 'chats#validate_username'
  post '/chats/validate_phonenumber', to: 'chats#validate_phonenumber'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users, only: [:show, :edit, :update]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
