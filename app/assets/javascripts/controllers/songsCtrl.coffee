class SongsCtrl extends BaseMvcCtrl
	@resolve songs: (SongsHome) => SongsHome.get().data()

	@route "/songs",
		templateUrl: "templates/songs"

	@inject()

	initialize: =>
		window.debu = @s