#= require testDependencies

class TweetsCtrl extends BaseCtrl
	@resolve
		hashtags: ->

	@route "/tweets",
		templateUrl: "partials/tweets"

	@inject()

class UserTweetsCtrl extends TweetsCtrl
	@resolve
		followers: ->

	@route "/tweets/me",
		templateUrl: "partials/user-tweets"

	@inject()

describe "BaseCtrl", ->
	it "defining a controller should register its route on Angular", inject ($route) ->
		expect($route.routes["/tweets"]).toHaveProperties
			templateUrl: "partials/tweets"
			controller: "TweetsCtrl"

	it "should set references to the resolved dependencies in the scope", inject ($controller, $rootScope) ->
		scope = $rootScope.$new()

		ctrl = $controller "TweetsCtrl",
			$scope: scope
			hashtags: ["#trendingTopic"]

		expect(scope.hashtags).toEqual ['#trendingTopic']

	it "can inherit resolved dependencies and add new ones", inject ($controller, $rootScope) ->
		scope = $rootScope.$new()

		ctrl = $controller "UserTweetsCtrl",
			$scope: scope
			hashtags: ["#trendingTopic"]
			followers: ["@anotheruser"]

		expect(scope.hashtags).toEqual ["#trendingTopic"]
		expect(scope.followers).toEqual ["@anotheruser"]