Rails.application.routes.draw do
  resources :attempt_answers

  resources :attempt_questions

  resources :test_attempts

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
