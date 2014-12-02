# Generic controller for a REST Api
class ApiController < ActionController::Base
	include ExceptionFilter
	around_filter :catch_exceptions
	rescue_from Exception do |e| catch_unhandled_errors(e) end
		
	protect_from_forgery with: :null_session

	#--------
	protected
	#--------

	# Allows methods like "bad_request!" or properties like "id"
	def method_missing(method_name, *args)
		method_name = method_name.to_s

		if method_name.ends_with? "!"
			json = args.first || ""
			status = method_name.sub("!", "").to_sym
			json! json, status
		else
			param = method_name.to_sym
			params[param]
		end
	end

	#------
	private
	#------

	def json!(json, code)
		render json: json, status: code
	end

	def transform(model)
		model.to_dto
	end
end