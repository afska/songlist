# Add Bower components to assets pipeline
config = Songlist::Application.config

config.assets.paths << Rails.root.join("vendor", "assets", "components")