Rails.application.routes.draw do

	devise_for :users, path_names: { 
		sign_up: '' #Stop Sign Up
	}

	root to: "orders#index"
  
 	resources :orders do 
		collection do 
			get '/orders/track_order', to: 'orders#track_order', as: 'track_order'
			get 'search_order_status'
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
