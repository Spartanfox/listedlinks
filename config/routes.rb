Rails.application.routes.draw do

  resources :pages do
    resources :links
  end



  get '/:id', to: 'pages#show'
  
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'

  get '/help', to: 'static_pages#help'

  get '/contact', to: 'static_pages#contact'

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  get "*path", to: redirect('/home')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
