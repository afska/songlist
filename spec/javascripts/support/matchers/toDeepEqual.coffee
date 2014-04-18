beforeEach ->
	jasmine.addMatchers
		toDeepEqual: ->
			compare: (actual, expected) ->
				pass = JSON.stringify(actual) == JSON.stringify(expected)
				pass: pass
				message: if !pass then "The object #{JSON.stringify actual} is not equal to #{JSON.stringify expected}." else ""