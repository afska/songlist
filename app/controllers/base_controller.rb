include Rack
require_all "app/models/exceptions"

class BaseController < ActionController::Base
	protect_from_forgery with: :exception
	skip_before_filter :verify_authenticity_token
	around_filter :catch_exceptions

	#--------
	protected
	#--------

	def json!(json, code)
		render json: json, status: status(code)
	end

	def id
		params[:id]
	end
	
	def validate(model)
		if model.invalid?
			raise ValidationException.new(model.errors.messages)
		end
	end

	def transform(model)
		model.to_dto
	end

	#------
	private
	#------

	def catch_exceptions
		yield
	rescue ActionController::ParameterMissing
		errors! [
			{ parameter: [ "is missing" ] }
		]
	rescue Mongoid::Errors::DocumentNotFound
		errors! [
			{ entity: [ "not found" ] }
		]
	rescue ValidationException => e
		errors! e.messages
	end

	def errors!(errors)
		render json: { errors: errors }, status: status(:bad_request)
	end

	def status(code)
		Utils.status_code(code)
	end
end