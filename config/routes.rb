Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # this will set the home page and get are the RESTAPI methods root '<controller name>#action'
  root 'static_pages#home'
end
