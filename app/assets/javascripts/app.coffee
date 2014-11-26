# The main angular application
@app = angular
	.module "songlist", [
		"ngRoute"
		"ngResource"
		"ngCookies"
		"pascalprecht.translate"
	]

	# Loading stuff:
	.run ($rootScope) ->
		$rootScope.$on '$routeChangeStart', => $rootScope.isLoading = true
		$rootScope.$on '$routeChangeSuccess', => $rootScope.isLoading = false

	# i18n stuff:
	.config ($translateProvider) ->
		$translateProvider.useUrlLoader "language"
		$translateProvider.determinePreferredLanguage()

	# Routes stuff:
	.config ($routeProvider) ->
		$routeProvider.otherwise redirectTo: "/"