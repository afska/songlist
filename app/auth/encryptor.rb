class Encryptor
	SECRET = WebApp::Application.config.secret_key_base
	OPTIONS = { algorithm: "des-ecb", password: SECRET }

	def self.encode(string)
		string.encrypt(:symmetric, OPTIONS).strip
	end

	def self.decode(string)
		string.decrypt :symmetric, OPTIONS
	end
end