Songlist::Application.routes.draw do
	scope "api", defaults: {format: :json} do
		get "songs", to: "songs#index"
		get "songs/:id", to: "songs#get"
		post "songs", to: "songs#create"
		put "songs/:id", to: "songs#update"
		delete "songs/:id", to: "songs#delete"
	end
end