class Song
	include Mongoid::Document

	field :title, type: String
	field :author, type: String
	field :submitted_at, type: Date
	field :user_id, type: String
end 