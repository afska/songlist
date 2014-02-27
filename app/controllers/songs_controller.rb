include Rack

class SongsController < ApplicationController
	def index
		Song.create(title: "La danza de los mirlos")

		algo = Song.new()
		render json: algo, status: status(:ok)
	end

	def create
		render json: { id: 22 }, status: status(:created)
	end

	def update
		render status: status(:ok)
	end

	def destroy
		render status: status(:ok)
	end

	#------
	private
	#------

	def status(code)
		Utils.status_code(code)
	end
end