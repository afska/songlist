#= require testDependencies

class AccountCtrl extends BaseMvcCtrl
	@register()
	@inject()

describe "BaseMvcCtrl", ->
	ctrl = null
	scope = null

	beforeEach ->
		inject ($controller, $rootScope) ->
			scope = $rootScope.$new()
			ctrl = $controller "AccountCtrl", $scope: scope

	it "can start and stop loading by a promise", inject ($q) ->
		deferred = $q.defer()

		ctrl.load deferred.promise
		expect(scope.isLoading).toBeTruthy()
		deferred.resolve() ; scope.$apply()
		expect(scope.isLoading).toBeFalsy()

	it "can set a notification into the scope", ->
		ctrl.setNotification "an-error-has-ocurred"
		expect(scope.notification).toEqual "an-error-has-ocurred"

	it "can unset the notification from the scope", ->
		ctrl.setNotification()
		expect(scope.notification).toBeUndefined()

	it "can raise a focus event", (done) ->
		scope.$on "focus", done
		ctrl.focus()