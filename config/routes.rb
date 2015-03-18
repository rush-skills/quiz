Rails.application.routes.draw do
  resources :packages

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

  get '/institute/:iid/:uid/add' => 'institute#add_user_to_institute'
  get 'institute/:uid/add' => 'institute#add_user_to_current_institute'

  get '/institute/:iid/:uid/iadd' => 'institute#add_admin_to_institute'

  resources :tests do
    resources :questions
  end
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/dashboard' => 'dashboard#index'
end
