Rails.application.routes.draw do
  
  root 'sessions#new'
  
  get '/welcome', to: 'welcome#welcome'

  get '/', to: 'sessions#new', as: 'login'

  post '/', to: 'sessions#create'

  get '/new', to: 'users#new', as: 'new_user'

  post '/new', to: 'users#create'

  post '/logout', to: 'sessions#destroy'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
