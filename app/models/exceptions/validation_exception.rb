# Exception for validation errors in Models
class ValidationException < RuntimeError
	attr_reader :messages
	
	def initialize(messages)
		@messages = messages
	end
end