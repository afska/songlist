# A Home for a REST resource
app.factory "Home", ($http) ->
	class Home
		constructor: (name) ->
			@url = "api/#{name}"

		get: -> $http.get @url
		getById: (id) -> $http.get @url + "/#{id}"
		post: (json) -> $http.post @url, json
		put: (id, json) -> $http.put @url + "/#{id}", json
		delete: (id) -> $http.delete @url + "/#{id}"