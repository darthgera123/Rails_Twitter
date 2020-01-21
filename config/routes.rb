Rails.application.routes.draw do
  get 'users/new'
  # get 'static_pages/home'
  # get 'static_pages/help'
  # get 'static_pages/about'
  # get 'static_pages/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # this will set the home page and get are the RESTAPI methods root '<controller name>#action'
  root 'static_pages#home'
  # get '/help', to: 'static_pages#help', as: 'helpy'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
end
