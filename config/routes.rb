Rails.application.routes.draw do
root to: 'pages#index'

  get '/about', to:'pages#about', as:'about'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :categories, only:[:index,:show,:edit,:update]
  resources :items, only:[:show,:edit,:update]

  resources :orders, only:[:index,:update,:destroy]

  post 'orders/:id', to:'orders#create'
  get 'orders/minus/:id', to:'orders#minus', as:'minus'
  get 'orders/plus/:id', to:'orders#plus', as:'plus'
  get 'orders/confirm', to:'orders#confirm', as:'confirm'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
