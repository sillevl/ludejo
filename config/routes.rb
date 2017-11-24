Rails.application.routes.draw do
  get '/map' => 'page#map', :as => 'map'

  root 'static_pages#home'

  get '/help' => 'static_pages#help', :as => 'help'

  get '/about' => 'static_pages#about', :as => 'about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
