# A Home for getting a Resource. A model class and
# an adapter can be provided for the perform of specific
# transformations, after the resource is fetched.
class @Home
	constructor: (@resource, @modelClass, @adapter) ->

	# Get all
	get: =>
		promise = @resource.query().$promise

		if @adapter?
			promise = promise.then @_adapt

		promise = promise.then @_createModels

		promise

	# Get one by id
	getById: (id) =>
		promise = @resource.get(id: id).$promise

		promise.then @_createModel

	_adapt: (elements) =>
		@adapter.adapt elements

	_createModels: (elements) =>
		elements.map @_createModel

	_createModel: (element) =>
		if @modelClass?
			new @modelClass element
		else
			element