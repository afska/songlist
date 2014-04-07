class SongsController < ApiController
	def index
		songs = Song.all
		json! songs.map { |s| transform(s) }, :ok
	end

	def get
		song = Song.find id
		json! transform(song), :ok
	end

	def create
		song = Song.create body_song
		song.validate
		json! transform(song), :created
	end

	def update
		song = Song.find id
		song.update_attributes body_song
		song.validate
		json! transform(song), :ok
	end

	def delete
		Song.find(id).remove
		json! "", :ok
	end

	#------
	private
	#------

	def body_song
		params
			.require(:song)
			.permit :title, :author, :genre
	end
end