class Model
	include ActiveModel::Validations

	def to_dto
		raise "should be implemented"
	end
end 