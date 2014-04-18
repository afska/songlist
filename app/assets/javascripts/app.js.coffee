@app = angular
	.module "songlist", [
		"ngRoute"
		"ngResource"
		"ngCookies"
	]

	.config ($routeProvider) ->
		$routeProvider
			.when '/',
				templateUrl: 'templates/landing.html'
				controller: "LandingCtrl"

			.otherwise redirectTo: '/'