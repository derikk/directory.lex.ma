class ApplicationController < ActionController::Base
	before_action :set_pass

	def set_session_pass
		session[:password] = params[:pass]
		if session[:password] == ENV["ADMIN_PASS"].presence || false
			flash[:success] = "Login successful!"
		end
		redirect_back(fallback_location: root_path)
	end
	
	private
	def set_pass
		@ADMIN_PASS = ENV["ADMIN_PASS"].presence || false
	end
end
