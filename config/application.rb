require File.expand_path('../boot', __FILE__)

# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(:default, Rails.env)

module Songlist
	class Application < Rails::Application
		# Add Middleware to catch JSON parse errors
		config.middleware.insert_before ActionDispatch::ParamsParser, "CatchJsonParseErrors"

		# Add Bower components to assets pipeline
		config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
	end
end
