Rails.application.routes.draw do
  # get '', to: 'experiences#resume'
  root 'resumes#index'
  resources :personal_infos, only: [:new, :create]

  namespace :api do
    resources :personal_infos, only: [:index] # You can define the specific actions you need
  end

  resources :experiences, only: [:new, :create]

  get 'experiences', to: 'experiences#index'
  post 'experiences', to: 'experiences#create'
  delete 'experiences/:id', to: 'experiences#delete'
end
