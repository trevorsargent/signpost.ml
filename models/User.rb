class User < ActiveRecord::Base
	has_many :signs
	has_secure_password
end