# DTO for Song
class SongDTO < Struct.new(
	:_id, :title,
	:author, :genre,
	:submitted_at
)
end