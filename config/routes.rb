Rails.application.routes.draw do
  resources :attempt_answers

  resources :attempt_questions

  resources :test_attempts

  resources :categories

  resources :institutes
  
  resources :answers
  
  get '/taketest' => 'testing#index', as: 'choose_test'
  get '/taketest/:id' => 'testing#take', as: 'take_test'
  get '/results/:id' => 'testing#result', as: 'test_result'
  post '/taketest/:id' => 'testing#submit', as: 'submit_test'
  get '/taketest/:test_id/:id' => 'testing#checked', as: 'checked_test'
  get '/taketest/:test_id/review/:id' => 'testing#review', as: 'review_test'
  resources :tests do
    resources :questions
  end
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/dashboard' => 'dashboard#index'
end
