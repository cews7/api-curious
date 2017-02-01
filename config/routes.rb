Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'github_home#index'

  get '/auth/github', as: :login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
