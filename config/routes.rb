Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get :login, to: "home#login"

  post :send_email, to: "home#send_email"
end
