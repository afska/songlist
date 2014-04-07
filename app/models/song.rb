class Song < Model
	include Mongoid::Document
	include ActiveModel::Validations

	field :title, type: String
	field :author, type: String
	field :genre, type: String
	field :submitted_at, type: Date
	field :user_id, type: String

	validates_presence_of :title
	validates_presence_of :author
	validates_presence_of :genre

	validates_length_of :title, maximum: 80
	validates_length_of :author, maximum: 50
	validates_length_of :genre, maximum: 30
end 