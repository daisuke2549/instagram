Rails.application.routes.draw do

<<<<<<< HEAD
  devise_for :accounts
  devise_scope :account do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end
=======
>>>>>>> master
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "profiles#index"
  resources :posts do
    resources :comments , only: [:new, :create]
  end
end
