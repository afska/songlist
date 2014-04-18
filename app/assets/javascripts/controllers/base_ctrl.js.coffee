# class @BaseCtrl
# 	@register: (app, name) ->
# 		name ?= @name || @toString().match(/function\s*(.*?)\(/)?[1]
# 		app.controller name, @

# 	@inject: (args...) ->
# 		@$inject = ['$scope'].concat args

# 	constructor: (args...) ->
# 		for key, index in @constructor.$inject
# 			@[key] = args[index]

# 		@s = @$scope

# 		for key, fn of @constructor.prototype
# 			continue unless typeof fn is 'function'
# 			continue if key in ['constructor', 'initialize'] or key[0] is '_'
# 			@s[key] = fn.bind?(@)

# 		@initialize?()