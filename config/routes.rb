Rails.application.routes.draw do

  devise_for :accounts
  devise_scope :account do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "profiles#show"
  resources :posts do
    resources :comments, only: [:index, :new, :create]
    resource :like, only: [:create]
  end
  get '/posts/:post_id/like', to: 'posts#show'
  resource :profile, only: [:show, :edit, :update]

end