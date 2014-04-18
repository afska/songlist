beforeEach ->
	jasmine.addMatchers
		toBeAnInstanceOf: ->
			compare: (actual, expectedTypeName) ->
				actualTypeName = actualTypeName.constructor.name

				if actualTypeName == expectedTypeName
					return pass: true, message: ""

				pass: false
				message: "Expected #{JSON.stringify actual} to be an instance of #{expectedTypeName}, but it was an instance of #{actualTypeName}."