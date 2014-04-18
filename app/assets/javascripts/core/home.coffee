# A Home for getting a Resource.
# A model class can be provided for its
# instantiation, after the resource is fetched.
class @Home
	constructor: (@resource, @modelClass) ->

	# Get all
	get: =>
		@resource
			.query()
			.$promise
			.then @_createModels

	# Get one by id
	getById: (id) =>
		@resource
			.get(id: id)
			.$promise
			.then @_createModel

	_adapt: (elements) =>
		@adapter.adapt elements

	_createModels: (elements) =>
		elements.map @_createModel

	_createModel: (element) =>
		if @modelClass?
			new @modelClass element
		else
			element