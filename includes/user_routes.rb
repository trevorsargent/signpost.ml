# GET /////////////

get '/api/user/login/:login' do
	content_type :json
	user = User.find_by(user_name: params[:login])
	user.to_json

end

get '/api/user/login/:login/signs' do
	content_type :json
	user = User.find_by(user_name: params[:login])
	signs = user.signs.all
	signs.to_json

end

get '/api/user/id/:id/signs' do
	content_type :json
	user = User.findby(name: params[:name])
	signs = user.signs.all
	signs.to_json
end



get '/api/users' do
	content_type :json

	users = User.all
	users.to_json
end 

get '/api/user/id/:id' do

	content_type :json

	user = User.find params[:id]
	user.to_json
end

# POST /////////////

post '/api/users' do

	content_type :json

	user = User.new params
	if user.save
		status 201 #created
	else
		status 500 #error
	end
end

# PUT /////////////

put '/api/users/:id' do 

	content_type :json

	user = User.find params[:id]
	if user.update params[:user]
		status 200
	else
		status 500
	end
end

# DELETE /////////////

delete '/api/users/:id' do

	content_type :json
	
	user = User.find params[:id]
	if user.destroy
		status 200
		
	else
		status 500
		
	end
end










