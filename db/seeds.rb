user_list = [
	["Trevor Sargent", "tbird1710", "wat"],
	["Tyne Cliffton", "tzcliff", "nooooo"],
	["Sophie Swenson", "soswen", "lololo"]
]

user_list.each do |name, user_name, password|
	User.create(name: name, user_name: user_name, password: password, password_confirmation: password)
end

