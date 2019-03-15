Rails.application.routes.draw do
	root 'homes#index'
	put '/homes',to:'homes#update'
	get 'show_cart',to:'homes#show_cart'
	get '/homes/contact',to: 'homes#contact'
	get '/homes/apropos',to:'homes#apropos'
	post 'homes/stripe' , to: 'homes#stripe',as:'stripe'
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  resources :items
  resources :homes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
