Rails.application.routes.draw do
  # get '', to: 'experiences#resume'
  root 'resumes#index'
  resources :personal_informations, only: [:new, :create]
  # get 'experiences', to: 'experiences#index'
  # post 'experiences', to: 'experiences#add'
  # delete 'experiences/:id', to: 'experiences#delete'
end
