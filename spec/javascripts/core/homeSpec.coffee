#= require testDependencies

describe "Home", ->
	DogsResource = null
	dog1 = { id: 1, name: "Cesar" }
	dog2 = { id: 2, name: "Avellanedo" }

	beforeEach inject ($httpBackend, $resource) ->
		$httpBackend
			.whenGET("/api/dogs")
			.respond [dog1, dog2]

		$httpBackend
			.whenGET("/api/dogs?id=2")
			.respond dog2

		DogsResource = $resource "/api/dogs", {}

	it "can get all the entities", inject ($httpBackend) ->
		home = new Home(DogsResource)

		home.get().then (dogs) =>
			expect(dogs).toDeepEqual [dog1, dog2]
		
		$httpBackend.flush()

	it "can get a specific entity", inject ($httpBackend) ->
		home = new Home(DogsResource)

		home.getById(2).then (dogs) =>
			expect(dogs).toHaveProperties dog2

		$httpBackend.flush()