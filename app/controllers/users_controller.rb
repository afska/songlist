# Handles the authentication
class UsersController < ApiController
	def login
		User.login username, password
		ok! token
	end

	def register
		user = User.create body_user
		user.validate
		created! token
	end

	def change_password
		user = User.login username, old_password
		user.password = new_password
		user.validate
		user.update
		ok! token
	end

	#------
	private
	#------

	def token
		{ token: Encryptor.encode(username) }
	end

	def body_user
		params
			.require(:user)
			.permit :username, :password
	end
end