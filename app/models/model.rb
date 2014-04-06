class Model
	include Mongoid::Document
	include ActiveModel::Validations

	before_create :assign_id

	#------
	private
	#------

	def get_id
		raise "not implemented"
	end

	def assign_id
		self.id = id()
	end
end 