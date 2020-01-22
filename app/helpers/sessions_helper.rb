module SessionsHelper
	def log_in(user)
		# writting on the browser cookie that save this session
		session[:user_id] = user.id
	end

	def current_user
		if session[:user_id]
			@current_user = @current_user || User.find_by(id: session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out(user)
		session.delete(user_id)
		@current_user = nil
	end

end
