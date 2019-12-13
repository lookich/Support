Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  resources :questions, only: [:new, :create, :index] do
    resources :answers, only: [:new, :create] do
      resources :corrects, only: [:new, :create]
    end
  end
  post 'corrects/moderate'
end
