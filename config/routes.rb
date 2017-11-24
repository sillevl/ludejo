Rails.application.routes.draw do
  get 'api/monsters'

  get '/map' => 'page#map', :as => 'map'

  root 'static_pages#home'

  get '/help' => 'static_pages#help', :as => 'help'

  get '/about' => 'static_pages#about', :as => 'about'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations'  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end