Songlist::Application.routes.draw do
	scope "api", defaults: {format: :json} do
		resources :songs, only: [:index, :create, :update, :destroy]
	end
end