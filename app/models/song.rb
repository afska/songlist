# A song
class Song < Model
	include Mongoid::Document
	before_validation :before_save

	field :identificator, type: String
	field :title, type: String
	field :author, type: String
	field :genre, type: String
	field :submitted_at, type: DateTime
	field :user, type: String

	validates_presence_of :title
	validates_presence_of :author
	validates_presence_of :genre

	validates_length_of :title, maximum: 80
	validates_length_of :author, maximum: 50
	validates_length_of :genre, maximum: 30

	validates_uniqueness_of :identificator

	def to_dto
		SongDTO.new(
			self._id.to_str, self.title, 
			self.author, self.genre,
			self.submitted_at
		)
	end

	#------
	private
	#------

	def before_save
		self.identificator = "#{self.genre}-#{self.author}-#{self.title}"
		self.submitted_at = DateTime.now
	end

	#TODOs:
	# - Login with fb
	# - Hacer autenticación en la api (con algo simple)
	# - Deshardcodear el i18n y usar el config/locales/en.yml
	# - Empezar a hacer los resources
	# - Congelar las versiones de bower.json
	# - Testear cosas!
end