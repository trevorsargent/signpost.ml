class Sign < ActiveRecord::Base
	include ActiveUUID::UUID
	belongs_to :user
	belongs_to :post
end