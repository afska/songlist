# Returns the internacionalization keys, depending of the user language
class LanguageController < ApiController
	def get
		language = params[:lang]
			.split("_")
			.first
			
		redirect_to "/locales/#{language}.json"
	end
end