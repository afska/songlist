beforeEach ->
	jasmine.addMatchers
		toBeEmpty: ->
			compare: (actual) ->
				pass = _.isEmpty actual
				pass: pass
				message: if !pass then "Expected #{JSON.stringify actual} to be empty." else ""