# #= require testDependencies

# class SarasasCtrl extends BaseCtrl
# 	@resolve
# 		sarasas: (SarasasResource) ->
# 			@getAll SarasasResource

# 	@route "/sarasas",
# 		templateUrl: "templates/sarasas"

# 	@inject()

# describe "BaseCtrl", ->
# 	beforeEach inject ($httpBackend) ->
# 		$httpBackend.expectGET("/api/sarasas").respond [
# 			sarasa: "sasa"
# 			papa: "frita",
# 		,
# 			sarasa: "otra",
# 			papa: "asada"
# 		]

# 		app.factory "SarasasResource", ($resource) ->
# 			$resource "/api/sarasas", {} 

# 	it "can get all the entities from a resource", inject ($controller, $rootScope) ->
# 		scope = $rootScope.$new()

# 		ctrl = $controller "SarasasCtrl",
# 			$scope: scope
# 			sarasas: [{piola: "guacho"}]

# 		expect(scope.sarasas[0]).toEqual
# 			sarasa: "sasa"
# 			papa: "frita"
# 	it "piola", ->
# 		expect([]).toHaveProperties({})