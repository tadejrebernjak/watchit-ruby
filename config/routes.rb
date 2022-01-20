Rails.application.routes.draw do
  devise_for :users
  get 'users/view/:id' => 'users#show'
  patch "users/view/:id/upvote", to: "users#upvote"
  get 'videos/search/:query/:type', to: "videos#search"
  
  resources :users do
    member do
      patch "upvote", to: "users#upvote"
    end 
  end

  mount Commontator::Engine => '/commontator'

  resources :videos do
    member do
      patch "upvote", to: "videos#upvote"
      patch "downvote", to: "videos#downvote"
    end 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'videos#index'
end
