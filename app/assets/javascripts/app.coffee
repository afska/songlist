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

	#Auth stuff:
	.run ($rootScope, $cookies, $timeout, $location, $http) ->
		$rootScope.goTo = (path) ->
			goToRoute = => $location.path path
			$timeout goToRoute, 0

		$rootScope.$on "$routeChangeStart", (event, next) ->
			auth = $cookies.auth
			if not auth then $rootScope.goTo "/" ; return
			
			auth = JSON.parse auth
			$http.defaults.headers.common["Authorization"] = "Token token=#{auth.token}"
			$rootScope.goTo "/songs"