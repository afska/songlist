# The main angular application
@app = angular
	.module "songlist", [
		"ngRoute"
		"ngResource"
		"ngCookies"
	]

	.config ($routeProvider) ->
		$routeProvider.otherwise redirectTo: '/'