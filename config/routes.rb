Rails.application.routes.draw do

  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  devise_for :accounts
  devise_scope :account do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "profiles#index"
  resources :posts do
    resource :like, only: [:create, :destroy]
    resources :comments, only: %i[new create]
  end
  
  resources :profiles

  
end
