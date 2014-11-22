# A Home for getting a Resource.
class @Home
	constructor: (@resource) ->

	# Get all
	get: =>
		@_promise @resource.query()

	# Get one by id
	getById: (id) =>
		@_promise @resource.get(id: id)

	_promise: (resource) => resource.$promise