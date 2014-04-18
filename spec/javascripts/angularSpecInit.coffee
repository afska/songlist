beforeEach ->
	module "songlist"

	inject ($httpBackend) ->
		$httpBackend.whenGET(/language\?lang=/).respond()