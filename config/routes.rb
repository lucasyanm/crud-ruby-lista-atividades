Rails.application.routes.draw do
  get '/',
    to: 'activities#index',
    as: :activities_index

  post '/activities/create',
    to: 'activities#create',
    as: :activities_create
end
