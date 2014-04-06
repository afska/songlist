include Rack

class SongsController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def index
		songs = Song.all
		render json: songs, status: status(:ok)
	end

	def get
		song = Song.find params[:id]
		validate_and_render song, :ok
	end

	def create
		song = Song.create request_song
		validate_and_render song, :ok
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
			.permit :title, :author, :genre
	end

	def status(code)
		Utils.status_code(code)
	end

	def validate_and_render(model, code)
		if model.valid?
			render json: model, status: status(code)
		else
			render json: { errors: model.errors.messages }, status:status(:bad_request)
		end
	end
end