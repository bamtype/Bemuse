Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      get "Like", to: "posts#upvote"
      get "Dislike", to: "posts#downvote"
    end
    resources :comments
  end

  root 'posts#index'
end
