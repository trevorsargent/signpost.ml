# GET /////////////

get '/api/signs' do
	content_type :json

	signs = Sign.all
	signs.to_json
end 

get '/api/sign/id/:id' do

	content_type :json

	sign = Sign.find params[:id]
	sign.to_json
end

# POST /////////////

post '/api/signs' do

	content_type :json

	sign = Sign.new params
	if sign.save
		status 201 #created
	else
		status 500 #error
	end
end

# PUT /////////////

put '/api/sign/id/:id' do 

	content_type :json

	sign = Sign.find params[:id]
	if sign.update params[:sign]
		status 200
	else
		status 500
	end
end

# DELETE /////////////

delete '/api/sign/id/:id' do

	content_type :json

	sign = Sign.find params[:id]
	if sign.destroy
		status 200
	else
		status 500
	end
end