Rails.application.routes.draw do
  resources :categories

  resources :institutes
  
  resources :answers
  


  resources :tests do
    resources :questions
  end
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/dashboard' => 'dashboard#index'
end
