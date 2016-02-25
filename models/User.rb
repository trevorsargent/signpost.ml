class User < ActiveRecord::Base
	has_many :signposts
end