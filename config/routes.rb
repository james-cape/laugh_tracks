Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :comedians
  # get '/comedians', to: 'comedians#index'
  # get '/comedians/new', to: 'comedians#new'
  # post '/comedians', to: 'comedians#create'
  # get 'comedian/:id', to: 'comedian#show', as: :show

end
