# Add Middleware to catch JSON parse errors
config = Songlist::Application.config

config.middleware.insert_before ActionDispatch::ParamsParser, "CatchJsonParseErrors"