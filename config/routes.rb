Rails.application.routes.draw do
 # mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

	  scope module: 'api' do
	    namespace :v1 do
	    	resources :players
	    	mount_devise_token_auth_for 'User', at: 'auth'
	      resources :users
	    end
	  end
end
