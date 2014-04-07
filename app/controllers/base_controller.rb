include Rack

class BaseController < ApplicationController
	skip_before_filter :verify_authenticity_token
	around_filter :catch_exceptions

	#--------
	protected
	#--------

	def json!(json, code)
		render json: json, status: status(code)
	end

	def validate(model)
		if model.invalid?
			raise Exceptions::ValidationException.new(model.errors.messages)
		end
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
	rescue Exceptions::ValidationException => e
		errors! e.messages
	end

	def errors!(errors)
		render json: { errors: errors }, status: status(:bad_request)
	end

	def status(code)
		Utils.status_code(code)
	end
end