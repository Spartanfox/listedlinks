Rails.application.routes.draw do

  resources :links
  resources :pages
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'

  get '/help', to: 'static_pages#help'

  get '/contact', to: 'static_pages#contact'

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
