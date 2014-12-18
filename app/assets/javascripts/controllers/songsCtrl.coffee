class SongsCtrl extends BaseMvcCtrl
	@resolve songs: (SongsHome) => SongsHome.get().data()

	@route "/songs",
		templateUrl: "templates/songs"

	@inject()

	initialize: =>
		window.debu = @

	genres: =>
		_.keys @byGenre()

	byGenre: =>
		@s.songs
			.sortBy ["author", "title"]
			.groupBy "genre"