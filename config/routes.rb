Rails.application.routes.draw do
  devise_for :users
  root to: 'locations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :locations, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create]
  end
  resources :locations, only: [:destroy]
end
