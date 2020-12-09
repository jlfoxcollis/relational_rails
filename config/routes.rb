Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index', as: 'home'
  #Dealer Parent
  get '/dealers', to: 'dealers#index', as: 'dealers'
  get '/dealers/new', to: 'dealers#new', as: 'new_dealer'
  post '/dealers', to: 'dealers#create', as: 'create_dealer'
  get '/dealers/:id', to: 'dealers#show', as: 'show_dealer'
  get '/dealers/:id/edit', to: 'dealers#edit', as: 'edit_dealer'
  patch '/dealers/:id', to: 'dealers#update', as: 'update_dealer'
  delete '/dealers/:id', to: 'dealers#destroy', as: 'destroy_dealer'


  #Roads Parent

  get '/roads', to: 'roads#index'
  get '/roads/new', to: 'roads#new'
  post '/roads/new', to: 'roads#create'
  get '/roads/:id', to: 'roads#show'
  patch '/roads/:id', to: 'roads#update'
  get '/roads/:id/edit', to: 'roads#edit'
  delete '/roads/:id', to: 'roads#destroy'

  # Cars Child Roads Parent
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/roads/:id/cars/new', to: 'cars#new'
  post '/roads/:id/cars', to: 'cars#create'
  get '/cars/:id/edit', to: 'cars#edit'
  patch '/cars/:id', to: 'cars#update'
  delete '/cars/:id', to: 'cars#destroy'

  # Trucks Child Dealer Parent
  get '/trucks', to: 'trucks#index', as: 'trucks'
  get '/dealers/:id/trucks/new', to: 'trucks#new', as: 'new_truck'
  post '/dealers/:id/trucks', to: 'trucks#create', as: 'create_truck'
  get '/trucks/:id/edit', to: 'trucks#edit', as: 'edit_truck'
  patch '/trucks/:id', to: 'trucks#update', as: 'update_truck'
  get '/trucks/:id', to: 'trucks#show', as: 'show_truck'
  delete '/trucks/:id', to: 'trucks#destroy', as: 'destroy_truck'

  get '/dealers/:id/trucks', to: 'trucks_dealer#index', as: 'trucks_dealer'
  get '/dealers/:id/trucks/:id', to: 'trucks_dealer#show', as: 'show_trucks_dealer'
  get '/roads/:id/cars', to: 'cars_road#index', as: 'cars_road'
end
