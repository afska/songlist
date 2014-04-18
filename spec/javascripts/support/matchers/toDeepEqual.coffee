jasmine.Expectation.addMatchers
	toDeepEqual: ->
		compare: (actual, expected) ->
			pass: JSON.stringify(actual) == JSON.stringify(expected)
			message: "The object #{JSON.stringify actual} is not equal to #{JSON.stringify expected}."