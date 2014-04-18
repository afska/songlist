@app = angular
	.module "songlist", [
		"ngRoute"
		"ngResource"
		"ngCookies"
	]

	.controller("LandingCtrl", ($scope) ->
		$scope.piola = "guacho"
		window.debu = $scope
	)

	.config ($routeProvider) ->
		$routeProvider
			.when '/rutadeprueba',
				templateUrl: 'templates/landing.html'
				controller: "LandingCtrl"

			.otherwise redirectTo: '/'