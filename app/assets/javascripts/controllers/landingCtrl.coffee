class LandingCtrl extends BaseCtrl
	@route "/",
		templateUrl: "templates/landing"
	@inject()

	initialize: =>
		@s.piola = "guacho"
		window.debu = @s