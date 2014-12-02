# A Home for a REST resource
app.factory "Home", ($http, $q) ->
	class Home
		constructor: (name) ->
			@url = "api/#{name}"

		get: => @_helpers $http.get @url
		getById: (id) => @_helpers $http.get @url + "/#{id}"
		post: (json) => @_helpers $http.post @url, json
		put: (id, json) => @_helpers $http.put @url + "/#{id}", json
		delete: (id) => @_helpers $http.delete @url + "/#{id}"

		_helpers: (promise) =>
			promise.data = =>
				promise.then ({ data }) => data
			promise