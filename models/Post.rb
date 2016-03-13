class Post < ActiveRecord::Base
	include ActiveUUID::UUID
	has_many :signs
end