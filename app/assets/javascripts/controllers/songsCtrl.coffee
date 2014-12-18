class SongsCtrl extends BaseMvcCtrl
	@resolve songs: (SongsHome) => SongsHome.get().data()

	@route "/songs",
		templateUrl: "templates/songs"

	@inject "SongsHome"

	authors: => @_allThe "author"

	genres: => @_allThe "genre"

	byGenre: =>
		@s.songs
			.sortBy ["author", "title"]
			.groupBy "genre"

	create: =>
		@loadAndFocus (
			@SongsHome
				.post @s.song
				.data()
				.then @_create
		)

	edit: =>
		@loadAndFocus (
			@SongsHome
				.put @s.song._id, @s.song
				.data()
				.then (s) =>
					@_remove @s.song.editing
					@_create s
		)

	delete: (song) =>
		if @isLoading then return

		@loadAndFocus (
			@SongsHome
				.delete song._id
				.then => @_remove song
		)

	startEditing: (song) =>
		if @isLoading then return

		@s.song = _.clone song
		@s.song.editing = song
		@focus()

	clean: =>
		@s.song = {}
		@focus()

	_create: (song) =>
		@s.songs.push song
		@clean()

	_remove: (song) =>
		@s.songs.remove (it) => it is song

	_allThe: (x) =>
		@s.songs
			.mapBy x
			.uniq()
			.sort()