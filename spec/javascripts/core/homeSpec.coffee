#= require testDependencies

describe "Home", ->
	dog1 = { id: 1, name: "Cesar" }
	dog2 = { id: 2, name: "Avellanedo" }

	expectStatus = (promise, expected) ->
		promise.then ({ status }) => expect(status).toBe expected

	beforeEach ->
		inject ($httpBackend) ->
			$httpBackend
				.whenGET("api/dogs")
				.respond [dog1, dog2]

			$httpBackend
				.whenGET("api/dogs/2")
				.respond dog2

			$httpBackend
				.whenPOST("api/dogs").respond 201

			$httpBackend
				.whenPUT("api/dogs/2").respond 200

			$httpBackend
				.whenDELETE("api/dogs/2").respond 200

	it "can get all the entities", inject ($httpBackend, Home) ->
		new Home("dogs").get().then ({ data: dogs }) =>
			expect(dogs).toDeepEqual [dog1, dog2]
		
		$httpBackend.flush()

	it "can get a specific entity", inject ($httpBackend, Home) ->
		new Home("dogs").getById(2).then ({ data: dog }) =>
			expect(dog).toHaveProperties dog2

		$httpBackend.flush()

	it "can post a new entity", inject ($httpBackend, Home) ->
		expectStatus new Home("dogs").post({}), 201
		$httpBackend.flush()

	it "can put an entity for update", inject ($httpBackend, Home) ->
		expectStatus new Home("dogs").put(2, {}), 200
		$httpBackend.flush()

	it "can delete a specific entity", inject ($httpBackend, Home) ->
		expectStatus new Home("dogs").delete(2), 200
		$httpBackend.flush()