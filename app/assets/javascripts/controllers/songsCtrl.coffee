class SongsCtrl extends BaseMvcCtrl
	@resolve songs: (SongsHome) => SongsHome.get().data()

	@route "/songs",
		templateUrl: "templates/songs"

	@inject "SongsHome"

	initialize: =>
		window.debu = @

	genres: =>
		_.keys(@byGenre()).sort()

	byGenre: =>
		@s.songs
			.sortBy ["author", "title"]
			.groupBy "genre"

	add: =>
		@loadAndFocus (
			@SongsHome
				.post @s.song
				.data()
				.then (s) =>
					@s.songs.push s
					@clean()
		)

	delete: (song) =>
		if @isLoading then return

		@loadAndFocus (
			@SongsHome
				.delete song._id
				.then (s) =>
					@s.songs.remove (it) => it is song
		)

	edit: (song) =>
		if @isLoading then return
		
		alert "OMG"

	clean: =>
		@s.song = {}