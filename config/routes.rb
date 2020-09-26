Rails.application.routes.draw do

  devise_for :accounts
  root "profiles#index"
  devise_scope :account do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do 
    resources :comments, only: [:new, :create]
    resource :like, only: [:create, :destroy]
  end 

  resources :accounts do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
  resource :profile, only: [:show, :edit, :update]
  get '/accounts/:account_id/unfollows' , to: 'accounts#show'
  get '/accounts/:account_id/follows' , to: 'accounts#show'
end