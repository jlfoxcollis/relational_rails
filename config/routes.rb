Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  #Dealer Parent
  get '/dealers', to: 'dealers#index'
  get '/dealers/new', to: 'dealers#new'
  post '/dealers', to: 'dealers#create'
  get '/dealers/:id', to: 'dealers#show'
  get '/dealers/:id/edit', to: 'dealers#edit'
  patch '/dealers/:id', to: 'dealers#update'
  delete '/dealers/:id', to: 'dealers#destroy'


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
  get '/trucks', to: 'trucks#index'
  post '/trucks', to: 'trucks#index'
  get '/dealers/:id/trucks/new', to: 'trucks#new'
  post '/dealers/:id/trucks', to: 'trucks#create'
  get '/trucks/:id/edit', to: 'trucks#edit'
  patch '/trucks/:id', to: 'trucks#update'
  get '/trucks/:id', to: 'trucks#show'
  get '/dealers/:id/trucks/:id', to: 'trucks#show'
  delete '/trucks/:id', to: 'trucks#destroy'
  
  get '/dealers/:id/trucks', to: 'trucks_dealer#index'
  get '/roads/:id/cars', to: 'cars_road#index'
end
