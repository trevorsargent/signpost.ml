class User < ActiveRecord::Base
	# include ActiveUUID::UUID
	validates :user_name, uniqueness: true
	has_many :signs
	has_secure_password
end