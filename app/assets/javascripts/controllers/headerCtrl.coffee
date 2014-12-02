class HeaderCtrl extends BaseCtrl
	@register()
	@inject "$location", "$cookies"

	isActive: (viewLocation) =>
		viewLocation is @$location.path()

	logout: =>
		delete @$cookies.auth
		@s.goTo "/"