require File.expand_path('../boot', __FILE__)

# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(:default, Rails.env)

module Songlist
	class Application < Rails::Application
		# Settings in config/environments/* take precedence over those specified here.
		# Application configuration should go into files in config/initializers

		#Include all folders to AutoLoad
		Dir["#{config.root}/app/**/*"]
			.select { |f| File.directory? f }
			.each do |path|
				config.autoload_paths += [path]
			end
	end
end
