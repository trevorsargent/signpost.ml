class User < ActiveRecord::Base
	include ActiveUUID::UUID
	has_many :signs
	has_secure_password
end