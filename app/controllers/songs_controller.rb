# Handles the CRUD operations with Songs
class SongsController < ApiAuthController
	def index
		songs = Song.all
		ok! songs.map { |s| transform(s) }
	end

	def get
		song = Song.find id
		ok! transform(song)
	end

	def create
		song = Song.create body_song
		song.validate
		created! transform(song)
	end

	def update
		song = Song.find id
		song.update_attributes body_song
		song.validate
		ok! transform(song)
	end

	def delete
		Song.find(id).remove
		ok!
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