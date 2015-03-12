Rails.application.routes.draw do
  resources :attempt_answers

  resources :attempt_questions

  resources :test_attempts

  resources :categories

  resources :institutes
  
  resources :answers
  
  get '/choosetest' => 'testing#index'
  get '/taketest/:id' => 'testing#take', as: 'take_test'
  get '/taketest/:test_id/:id' => 'testing#checked', as: 'checked_test'
  resources :tests do
    resources :questions
  end
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/dashboard' => 'dashboard#index'
end
