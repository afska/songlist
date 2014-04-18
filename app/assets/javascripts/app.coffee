# The main angular application
@app = angular
	.module "songlist", [
		"ngRoute"
		"ngResource"
		"ngCookies"
		"pascalprecht.translate"
	]

	.config ($routeProvider) ->
		$routeProvider.otherwise redirectTo: "/"

	.config ($translateProvider) ->
		$translateProvider.useUrlLoader "language"
		$translateProvider.determinePreferredLanguage()