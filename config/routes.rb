Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # map.connect ':controller/:action/:id'
  # match ':controller(/:action(/:id(.:format)))'
  # get 'index' => 'users#index'
  root 'users#index'
 
  resources :home
  resources :jobs  
  resources :candidates
  resources :news do 
    resources :comments
  end
  resources :abouts
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :sessions 
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :password_resets
  resources :level
  resources :recruitment
  resources :informations
  resources :experience_level
  resources :customer
  resources :project
  resources :our_customer
  resources :all_news

  get 'cv/:cv' =>'cvs#show'
  resources :interview_mailer
  resources :send_mail_to_candidate
  get 'send_mail'=>'jobs#send_mail'
  get 'send_mail_to_offer' =>'jobs#send_mail_to_offer'
  get 'statistic_by_job' =>'statistical#statistics_by_job'
  get 'statistic_by_apply'=>'statistical#statistics_by_apply'

end