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

post '/api/user/new' do

	content_type :json

	par = JSON.parse(request.body.read.to_s)
	par['id']=nil
	
	user = User.new par
	if user.save
		status 201 #created
		user.to_json
	else
		status 500 #error
	end
end

# PUT /////////////

put '/api/user/update' do 

	content_type :json

	par = JSON.parse(request.body.read.to_s)

	user = User.find par[:id]


	if params[:name] 
		user.name = par[:name]
	end

	if params[:user_name]
		user.user_name = par[:user_name]
	end

	if user.save
		status 200
		user.to_json
	else
		status 500
	end


end

# DELETE /////////////

delete '/api/user/delete' do

	content_type :json
	
	user = User.find params[:id]
	if user.destroy
		status 200
		
	else
		status 500
		
	end
end