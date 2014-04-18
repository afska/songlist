# Returns the internacionalization keys, depending of the user language
class LanguageController < ApiController
	def get
		data = { clave: "valor" } 
		json! data, :ok
	end
end