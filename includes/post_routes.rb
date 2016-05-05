# GET /////////////	

get '/api/posts' do
	content_type :json

	posts = Post.all
	posts.to_json
end 

get '/api/post/id/:id' do

	content_type :json

	post = Post.find params[:id]
	post.to_json
end

get '/api/post/id/:id/signs' do
	content_type :json
	post = Post.find params[:id]
	signs = post.signs.all
	signs.to_json
end

get '/api/post/title/:title' do

	content_type :json
	post = Post.find_by title: params[:title]
	post.to_json
end

get '/api/post/title/:title/signs' do

	content_type :json
	post = Post.find_by title: params[:title]
	signs = post.signs.all
	signs.to_json
end

get '/api/post/loc/:lat/:lng/:rad' do
	content_type :json

	posts = Array.new

	mLat = params[:lat].to_f
	mLng = params[:lng].to_f
	mRad = params[:rad].to_f

	Post.find_each do |post|
		if(dist(post.lat, mLat, post.long, mLng) < mRad) then
			posts.push(post)
		end
	end

	posts.to_json
end

def dist (lat1, lat2, lng1, lng2) 

		dist1 = lat1 - lat2
		dist2 = lng1 - lng2
		return Math.sqrt(dist1**2 + dist2 **2)
end

# POST /////////////

post '/api/post/new' do

	content_type :json

	@params = JSON.parse(request.body.read.to_s)
	

	post = Post.new @params
	if post.save
		status 201
	else
		status 500 #error
	end
	post.to_json
end

# PUT /////////////

put '/api/post/update' do 

	@params = JSON.parse(request.body.read.to_s)

	post = Post.find @params[:id]


	if params[:title]
		post.title = @params[:title]
	end
	if params[:lat]
		post.lat = @params[:lat]
	end
	if params[:long]
		post.long = @params[:long]
	end
	if params[:visible]
		post.visible = @params[:visible]
	end

	if post.save
		post.to_json
	else
		status 500
	end



end

# DELETE /////////////

delete '/api/post/delete' do

	content_type :json
	
	post = Post.find_by title: params[:title]
	if post.destroy
		status 200
		
	else
		status 500
		
	end
end
