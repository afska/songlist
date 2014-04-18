class @LandingCtrl extends BaseCtrl
	@register app
	@inject()

	initialize: =>
		@s.piola = "guacho"
		alert "SOY EL LANDING CONTOLLER"