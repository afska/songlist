# An user
class User < Model
	include Mongoid::Document

	field :username, type: String
	field :password, type: String

	validates_presence_of :username
	validates_presence_of :password

	validates_length_of :username, maximum: 30
	validates_length_of :password, maximum: 30

	validates_uniqueness_of :username

	index "username" => 1

	def self.login(username, password)
		me = self.where(username: username).first
		raise UnauthorizedLogin unless me && me.password == password
		me
	end
end