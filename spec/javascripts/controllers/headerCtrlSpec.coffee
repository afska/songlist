#= require testDependencies

describe "HeaderCtrl", ->
	ctrl = null
	scope = null

	beforeEach ->
		inject ($controller, $rootScope, $location) ->
			scope = $rootScope.$new()
			ctrl = $controller "HeaderCtrl", $scope: scope

			$location.path "/current"

	it "when the route starts to change, it should set isLoading to true", ->
		scope.$emit "$routeChangeStart"
		expect(scope.isLoading).toBeTruthy()

	it "when the route changes successfully, it should set isLoading to false", ->
		scope.$emit "$routeChangeSuccess"
		expect(scope.isLoading).toBeFalsy()

	it "can tell if one route is the current route", ->
		expect(ctrl.isActive("/current")).toBeTruthy()
		expect(ctrl.isActive("/another")).toBeFalsy()

	it "can tell if one route is the current route", ->
		expect(ctrl.isActive("/current")).toBeTruthy()
		expect(ctrl.isActive("/another")).toBeFalsy()

	it "deletes the auth cookie on logout", inject ($cookies) ->
		$cookies.auth = token: "a_secret_token"
		ctrl.logout()
		expect($cookies.auth).toBeUndefined()