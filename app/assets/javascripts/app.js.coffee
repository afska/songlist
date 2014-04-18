@app = angular
	.module "songlist", [
		"ngRoute"
		"ngResource"
		"ngCookies"
	]

app.config ($routeProvider) ->
	$routeProvider
		.when '/',
			templateUrl: 'templates/landing.html'
			controller: "LandingCtrl"

		.otherwise redirectTo: '/'