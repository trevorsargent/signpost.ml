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

post '/api/sign/new' do

	content_type :json

	@params = JSON.parse(request.body.read.to_s)

	sign = Sign.new @params
	if sign.save
		status 201 #created
		sign.to_json
	else
		status 500 #error
	end

end

# PUT /////////////

put '/api/sign/update' do 

	content_type :json

	@params = JSON.parse(request.body.read.to_s)

	sign = Sign.find @params[:id]

	if params[:message]
		sign.message = @params[:message]
	end
	if params[:type_label]
		sign.type_label = @params[:type_label]
	end

	if post.save?
		status 200
		sign.to_json
	else
		status 500
	end


end

# DELETE /////////////

delete '/api/sign/delete' do

	content_type :json

	sign = Sign.find params[:id]
	if sign.destroy
		status 200
	else
		status 500
	end
end