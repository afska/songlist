# For a resource named "foo", the Home's name is FooHome

createHome = (name) ->
	app.factory "#{name.capitalize()}Home", (Home) -> new Home name
createHomes = (names...) -> names.map createHome

#---

createHomes "login", "songs"