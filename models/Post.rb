class Post < ActiveRecord::Base
	# include ActiveUUID::UUID
	validates :title, uniqueness: true
	validates :title, presence: true
	validates :lat, presence: true
	validates :long, presence: true
	has_many :signs
end
