class SongsCtrl extends BaseCtrl
	@route "/songs",
		templateUrl: "templates/songs"
	@inject()

	initialize: =>
		@s.piola = "guacho"
		window.debu = @s