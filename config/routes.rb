Rails.application.routes.draw do
  resources :activities
  
  get '/',
    to: 'activities#index',
    as: :activities_index

end
