Rails.application.routes.draw do
  resources :institute_packages

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
  
  get '/superadmin/verified_user' => 'superadmin#verified_user', as: 'verified_user'
  get '/superadmin/admin' => 'superadmin#admin', as: 'admin'
  get '/superadmin/insitute_admin' => 'superadmin#insitute_admin', as: 'insitute_admin'
  get '/superadmin/prof' => 'superadmin#prof', as: 'professor'
  get '/superadmin/reports' => 'superadmin#report', as: 'reports'
  get '/superadmin/package' => 'superadmin#package', as: 'change_insitute_package'

  resources :tests do
    resources :questions
  end
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/dashboard' => 'dashboard#index'
end
