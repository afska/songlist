# Add Bower components to assets pipeline
config = WebApp::Application.config

config.assets.paths << Rails.root.join("vendor", "assets", "components")