# Add Bower components to assets pipeline
config = ExampleApp::Application.config

config.assets.paths << Rails.root.join("vendor", "assets", "components")