class LandingCtrl extends BaseMvcCtrl
	@route "/",
		templateUrl: "templates/login"
	@inject "LoginHome", "$cookies"

	login: =>
		@loadAndFocus (
			@LoginHome
				.post @s.credentials
				.success @createCookieAndRedirect
				.error => @setNotification "invalid-login"
		)

	createCookieAndRedirect: (data) =>
		@$cookies.auth = JSON.stringify data
		@s.goTo "/start"