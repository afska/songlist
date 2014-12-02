class LandingCtrl extends BaseMvcCtrl
	@route "/",
		templateUrl: "templates/login"
	@inject "LoginHome", "$cookies"

	login: =>
		@load(
			@LoginHome.post(@s.credentials)
				.success(@createCookieAndRedirect)
				.error(() => @setNotification "invalid-login")
		).finally @focus

	createCookieAndRedirect: (data) =>
		@$cookies.auth = JSON.stringify data
		@s.goTo "/start"