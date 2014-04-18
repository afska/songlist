#= require testDependencies

describe "Home", ->
	DogsResource = null
	dog1 = { id: 1, name: "Cacho" }
	dog2 = { id: 2, name: "Ruperta" }

	class Dog
		constructor: (json) -> angular.extend @, json
		helloMessage: => "My name is #{@name}"

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

	it "can get all the entities with a model class", inject ($httpBackend) ->
		home = new Home(DogsResource, Dog)

		home.get().then (dogs) =>
			getMessage = (it) -> it.helloMessage()

			expect(dogs[0]).toBeAnInstanceOf "Dog"
			expect(dogs.map(getMessage))
				.toDeepEqual ["My name is Cacho", "My name is Ruperta"]

		$httpBackend.flush()

	it "can get a specific entity with a model class", inject ($httpBackend) ->
		home = new Home(DogsResource, Dog)

		home.getById(2).then (dog) =>
			expect(dog).toBeAnInstanceOf "Dog"
			expect(dog.helloMessage())
				.toBe "My name is Ruperta"

		$httpBackend.flush()