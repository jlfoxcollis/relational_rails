Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Dealer Parent
  get '/', to: 'welcome#index'
  get '/dealers', to: 'dealers#index'
  get '/dealers/new', to: 'dealers#new'
  post '/dealers', to: 'dealers#create'
  get '/dealers/:id', to: 'dealers#show'
  get '/dealers/:id/edit', to: 'dealers#edit'
  patch '/dealers/:id', to: 'dealers#update'
  get '/dealers/:id/delete', to: 'dealers#delete'
  delete '/dealers/:id', to: 'dealers#destroy'
  get '/dealers/:id/trucks', to: 'dealers#trucks'

  #Roads Parent



  get '/trucks', to: 'trucks#index'
  get '/trucks/new', to: 'trucks#new'
  post '/trucks', to: 'trucks#create'
  get '/trucks', to: 'dealers#index'
  get '/trucks/:id', to: 'trucks#show'
end
