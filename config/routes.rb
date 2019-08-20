Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#index'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :locations, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
end
