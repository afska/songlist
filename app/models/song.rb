class Song
	include Mongoid::Document
	before_create :assign_id

	field :title, type: String
	field :author, type: String
	field :genre, type: String
	field :submitted_at, type: Date
	field :user_id, type: String

	#------
	private
	#------

	def assign_id
		self.id = "#{self.title}-#{self.author}"
	end
end 