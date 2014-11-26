# A Home for a REST resource
app.factory "Home", ($http) ->
	class Home
		constructor: (name) ->
			@url = "api/#{name}"

		get: (id) -> $http.get @url
		getById: (id) -> $http.get @url + "/#{id}"
		post: (json) -> $http.post @url, json
		put: (json) -> $http.put @url, json
		delete: (id) -> $http.delete @url + "/#{id}"