class SongsController < BaseController
	def index
		songs = Song.all
		json! songs, :ok
	end

	def get
		song = Song.find params[:id]
		json! song, :ok
	end

	def create
		song = Song.create body_song
		validate song
		json! song, :created
	end

	def update
		json! "", :ok
	end

	def delete
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