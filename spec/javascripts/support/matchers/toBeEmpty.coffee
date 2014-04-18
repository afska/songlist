jasmine.Expectation.addMatchers
	toBeEmpty: ->
		compare: (actual) ->
			pass: _.isEmpty actual
			message: "Expected #{JSON.stringify actual} to be empty."