class ApplicationController < ActionController::Base
	def hello
		render html: "hullo mundo"
	end
end
