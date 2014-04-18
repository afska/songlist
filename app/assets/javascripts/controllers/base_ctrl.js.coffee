class Home
	constructor: (@resource, @modelClass, @adapter) ->

	get: =>
		promise = @resource.query().$promise

		if (@adapter?)
			promise = promise.then @_adapt

		if (@modelClass?)
			promise = promise.then @_createModels

		promise

	getById: (id) =>
		promise = @resource.get(id: id).$promise

		promise.then @_createModel

	_adapt: (elements) =>
		@adapter.adapt elements

	_createModels: (elements) =>
		elements.map @_createModel

	_createModel: (element) =>
		new @modelClass element

class @BaseCtrl
	copyAndExtend = (destination, origin) ->
		copy = angular.copy destination or {}
		angular.extend copy, origin or {}

	@register: ->
		name = @name || @toString().match(/function\s*(.*?)\(/)?[1]
		app.controller name, @

		name

	@route: (path, route) ->
		base =
			controller: @register()
			resolve: @ctrlResolve

		app.config ($routeProvider) ->
			$routeProvider.when path, angular.extend base, route

	@resolve: (resolve) ->
		@ctrlResolve = copyAndExtend @ctrlResolve, resolve

	@inject: (args...) ->
		@$inject = _(['$scope'])
			.union(@$inject, args, _.keys @ctrlResolve)
			.uniq()
			.value()

	@getAll: (resource, modelClass, adapter) ->
		new Home(resource, modelClass, adapter).get()

	@getById: (id, resource, modelClass, adapter) ->
		new Home(resource, modelClass, adapter).getById id

	constructor: (args...) ->
		for key, index in @constructor.$inject
			@[key] = args[index]

		@s = @$scope

		for key, fn of @constructor.prototype
			continue unless typeof fn is 'function'
			continue if key in ['constructor', 'initialize'] or key[0] is '_'
			@s[key] = fn.bind?(@)

		if @constructor.ctrlResolve
			for key of @constructor.ctrlResolve
				@s[key] = @[key]

		@initialize?()