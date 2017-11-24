Rails.application.routes.draw do
  root 'static_pages#home'

  get '/help' => 'static_pages#help', :as => 'help'

  get '/about' => 'static_pages#about', :as => 'about'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
