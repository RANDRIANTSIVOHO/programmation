Rails.application.routes.draw do
  	resources :subscribers
	root 'subscribers#index'
end
