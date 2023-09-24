Rails.application.routes.draw do
  get '', to: 'experiences#index'
  get 'experiences', to: 'experiences#index'
  post 'experiences', to: 'experiences#add'
  delete 'experiences/:id', to: 'experiences#delete'
end
