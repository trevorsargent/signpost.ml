user_list = [
	["Trevor Sargent", "tbird1710", "wat"],
	["Tyne Cliffton", "tzcliff", "nooooo"],
	["Sophie Swenson", "soswen", "lololo"]
]

user_list.each do |name, user_name, password|
	User.create(name: name, user_name: user_name, password: password, password_confirmation: password)
end

@post = Post.create(title: "dovecote", lat: '5.0', long: '12.9', visible: "true")

@user = User.find_by(user_name: "tzcliff")	

@user.signs.create(message: "lol yes", post_id: @post.id)



