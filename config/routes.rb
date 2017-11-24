Rails.application.routes.draw do
  get 'api/monsters'
  get 'api/hungry'
  get 'api/happy'

  get '/map' => 'page#map', :as => 'map'

  root 'static_pages#home'

  get '/help' => 'static_pages#help', :as => 'help'

  get '/about' => 'static_pages#about', :as => 'about'

  get '/ranking' => 'static_pages#ranking', :as => 'ranking'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations'  }

  resources :monsters
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end