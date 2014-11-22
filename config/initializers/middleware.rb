# Add Middleware to catch JSON parse errors
config = ExampleApp::Application.config

config.middleware.insert_before ActionDispatch::ParamsParser, "CatchJsonParseErrors"