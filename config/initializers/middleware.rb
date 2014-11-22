# Add Middleware to catch JSON parse errors
config = WebApp::Application.config

config.middleware.insert_before ActionDispatch::ParamsParser, "CatchJsonParseErrors"