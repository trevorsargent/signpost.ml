user_list = [
	["Trevor Sargent", "tbird1710", "wat"],
	["Tyne Cliffton", "tzcliff", "nooooo"],
	["Sophie Swenson", "soswen", "lololo"]
]

user_list.each do |name, user_name, password|
	User.create(name: name, user_name: user_name, password: password, password_confirmation: password)
end

Post.find_each do |post|
post.destroy
end

@post = Post.create(title: "dovecote", lat: '45.4518618', long: '-122.6685581', visible: "true")
Post.create(title: "jupiper", lat: '45.447607', long: '-122.6744968', visible: "true")

@user = User.find_by(user_name: "tzcliff")	

@user.signs.create(message: "lol yes", post_id: @post.id)



