# Focus the element when certain event is emited
app.directive "focusOn", ($timeout) ->
	(scope, elem, attr) ->
		scope.$on attr.focusOn, (e) ->
			focus = => elem[0].focus()
			$timeout focus, 0