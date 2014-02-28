include Rack

class SongsController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def index
		songs = Song.all
		render json: songs, status: status(:ok)
	end

	def get
		song = Song.find params[:id]
		render json: song, status: status(:ok)
	end

	def create
		song = Song.create request_song
		render json: song, status: status(:created)
	end

	def update
		render status: status(:ok)
	end

	def delete
		render status: status(:ok)
	end

	#------
	private
	#------

	def request_song
		params
			.require(:song)
			.permit :title, :author, :submitted_at
	end

	def status(code)
		Utils.status_code(code)
	end
end