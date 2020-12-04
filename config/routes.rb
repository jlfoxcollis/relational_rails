Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Dealer Parent
  get '/', to: 'welcome#index'
  get '/dealers', to: 'dealers#index'
  get '/dealers/new', to: 'dealers#new'
  post '/dealers/new', to: 'dealers#create'
  get '/dealers/:id', to: 'dealers#show'
  get '/dealers/:id/edit', to: 'dealers#edit'
  post '/dealers/:id/edit', to: 'dealers#update'
  delete '/dealers/:id', to: 'dealers#destroy'
  get '/dealers/:id/trucks', to: 'dealers#trucks'

  #Roads Parent

  get '/roads', to: 'roads#index'
  get '/roads/new', to: 'roads#new'
  get '/roads/:id', to: 'roads#show'
  get '/roads/:id/edit', to: 'roads#edit'
  post '/roads', to: 'roads#create'
  patch '/roads/:id', to: 'roads#update'
  delete '/roads/:id', to: 'roads#destroy'

  # Cars Child Roads Parent

  get '/cars', to: 'cars#index'

  # Trucks Child Dealer Parent
  get '/dealers/:id/trucks/new', to: 'trucks#new'
  get '/trucks', to: 'trucks#index'
  get '/trucks/:id', to: 'trucks#show'
  get '/dealers/:id/trucks/:id', to: 'trucks#show'
  post '/dealers/:id/trucks/new', to: 'trucks#create'
  get '/dealers/:id/trucks/:id/edit', to: 'trucks#edit'
  post '/dealers/:id/trucks/:id/edit', to: 'trucks#update'
  delete '/trucks/:id', to: 'trucks#destroy'
end
