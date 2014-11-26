# A Controller with helper methods for managing views
class @BaseMvcCtrl extends BaseCtrl
	# Start and stop loading for a promise
	load: (promise) =>
		@startLoading()
		promise.finally @stopLoading
		promise

	# Sets a notification into the scope
	setNotification: (notification) => @s.notification = notification

	# Raise the focus event
	focus: => @s.$broadcast "focus"
	
	# Is loading
	startLoading: => @s.$root.isLoading = true

	# Is not loading anymore
	stopLoading: => @s.$root.isLoading = false