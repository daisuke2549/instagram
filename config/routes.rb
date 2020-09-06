Rails.application.routes.draw do

<<<<<<< HEAD
=======


>>>>>>> image_post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "profiles#index"
  resources :posts do
    resources :comments , only: [:new, :create]
  end
end
