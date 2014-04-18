class LandingCtrl extends BaseCtrl
	@route "/",
		templateUrl: "templates/landing"

	initialize: =>
		@s.piola = "guacho"
		window.debu = @s