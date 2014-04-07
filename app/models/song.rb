class Song < Model
	include Mongoid::Document
	before_validation :set_identificator

	field :identificator, type: String
	field :title, type: String
	field :author, type: String
	field :genre, type: String
	field :submitted_at, type: Date
	field :user, type: String

	validates_presence_of :title
	validates_presence_of :author
	validates_presence_of :genre

	validates_length_of :title, maximum: 80
	validates_length_of :author, maximum: 50
	validates_length_of :genre, maximum: 30

	validates_uniqueness_of :identificator

	#------
	private
	#------

	def set_identificator
		self.identificator = "#{self.genre}-#{self.author}-#{self.title}"
	end
end 