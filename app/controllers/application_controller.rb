class ApplicationController < ActionController::Base
	before_action :set_pass
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	
	private
	# There's got to be a better way to set this static variable.
	# Probably read from ENV.
	def set_pass
		@ADMIN_PASS = "shmoop"
	end
end
