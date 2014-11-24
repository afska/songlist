# Generic controller for a REST Api with authentication
class ApiAuthController < ApiController
	before_action :authenticate

	#------
	private
	#------

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			username = Encryptor.decode token
			@user = User.find_by username: username

			!@user.nil?
		end
	end
end