class Post < ActiveRecord::Base
	# include ActiveUUID::UUID
	validates :title, uniqueness: true
	has_many :signs
end