module SessionsHelper
	def log_in(user)
		# writting on the browser cookie that save this session
		session[:user_id] = user.id
	end

	def current_user
		# if session[:user_id]
		# 	@current_user = @current_user || User.find_by(id: session[:user_id])
		# end
		# this is still assignment and not comparison
		if (user_id = session[:user_id])
			@current_user = @current_user || User.find_by(id: session[:user_id])
		elsif (user_id = cookies.signed[:user_id])
			# raise used to check for coverage tests
			user = User.find_by(id: user_id)
			if user && user.authenticated?(cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end

	def logged_in?
		!current_user.nil?
	end



	def remember(user)
		# creates a remember token and stores on the cookie pairing it with user id
		# permanent stores the info for 20 years by default
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end


end
