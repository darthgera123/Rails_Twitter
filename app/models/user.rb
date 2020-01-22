class User < ApplicationRecord
	attr_accessor :remember_token
	# callback to fix the email
	before_save{email.downcase!}
	# email = email.downcase wont work.similar to python
	validates :name, presence: true,length: {maximum:50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,length: {maximum:255}, format: {with:VALID_EMAIL_REGEX},
	uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum:6}

	#Used for testing login
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
    end
    #Returns a random token. Used for cookie based sessions
    def User.new_token
    	SecureRandom.urlsafe_base64
    end

    def remember
    	self.remember_token = User.new_token
    	update_attribute(:remember_digest,User.digest(remember_token))
    end

    # compares the password stored in cookie with the remember token
    def authenticated?(remember_token)
    	# this is done for the cases when multiple browser windows are opened and you log out of one
    	return false if remember_digest.nil?
    	BCrypt::Password.new(remember_digest).is_password?(remember_token)
  	end

  	def forget
		update_attribute(:remember_digest,nil)
	end

end
