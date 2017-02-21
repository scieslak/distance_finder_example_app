Rails.application.routes.draw do
  root 'public_pages#home'
  post 'result', to: 'public_pages#calculate'
  get 'result', to: 'public_pages#calculate'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
