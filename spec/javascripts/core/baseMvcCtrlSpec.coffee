#= require testDependencies

class AccountCtrl extends BaseMvcCtrl
	@register()
	@inject()

describe "BaseMvcCtrl", ->
	it "should set references to the resolved dependencies in the scope", inject ($controller, $rootScope) ->
		scope = $rootScope.$new()

		ctrl = $controller "AccountCtrl",
			$scope: scope
			hashtags: ["#trendingTopic"]

		expect(scope.hashtags).toEqual ["#trendingTopic"]

	it "can inherit resolved dependencies and add new ones", inject ($controller, $rootScope) ->
		scope = $rootScope.$new()

		ctrl = $controller "UserTweetsCtrl",
			$scope: scope
			hashtags: ["#trendingTopic"]
			followers: ["@anotheruser"]

		expect(scope.hashtags).toEqual ["#trendingTopic"]
		expect(scope.followers).toEqual ["@anotheruser"]