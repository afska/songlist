# A Home for a Resource. A model class and
# an adapter can be provided for the perform of specific
# transformations, after the resource is fetched.
class Home
	constructor: (@resource, @modelClass, @adapter) ->

	# Get all
	get: =>
		promise = @resource.query().$promise

		if @adapter?
			promise = promise.then @_adapt

		if @modelClass?
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
		new @modelClass element

# A Controller. The route and inject methods MUST be called.
# Otherwise, angular won't found it or will not inject the $scope.
# A @s variable is created as a shortcut for $scope.
class @BaseCtrl
	copyAndExtend = (destination, origin) ->
		copy = angular.copy destination or {}
		angular.extend copy, origin or {}

	@$inject = ["$scope"] #default

	# Make the controller visible for a specific route.
	# If the route has params (id), the pattern is: "/route/:id"
	@route: (path, route) ->
		base =
			controller: @_register()
			resolve: @ctrlResolve

		app.config ($routeProvider) ->
			$routeProvider.when path, angular.extend(base, route)

	# Add dependencies (promises) that must be resolved before instanciation.
	# This dependencies will be injected in the $scope.
	# The route params can be accesed with: $route.current.params.id
	@resolve: (resolve) ->
		@ctrlResolve = copyAndExtend @ctrlResolve, resolve

	# Inject dependencies (including the resolves).
	@inject: (args...) ->
		@$inject = _(["$scope"])
			.union(@$inject, args, _.keys @ctrlResolve)
			.uniq()
			.value()

	# Get all the resources
	@getAll: (resource, modelClass, adapter) ->
		new Home(resource, modelClass, adapter).get()

	# Get a resource
	@getById: (id, resource, modelClass, adapter) ->
		new Home(resource, modelClass, adapter).getById id

	@_register: ->
		name = @name || @toString().match(/function\s*(.*?)\(/)?[1]
		app.controller name, @

		name

	constructor: (args...) ->
		for key, index in @constructor.$inject
			@[key] = args[index]

		@s = @$scope

		for key, fn of @constructor.prototype
			continue unless typeof fn is "function"
			continue if key in ["constructor", "initialize"] or key[0] is "_"
			@s[key] = fn.bind?(@)

		if @constructor.ctrlResolve
			for key of @constructor.ctrlResolve
				@s[key] = @[key]

		@initialize?()