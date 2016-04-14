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

	Post.find_each do |user|
		if(dist(user.lat, mLat, user.long, mLng) < mRad) then
			posts.push(user)
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

post '/api/posts' do

	content_type :json

	post = Post.new params
	if post.save
		status 201 #created
	else
		status 500 #error
	end
end

# PUT /////////////

put '/api/post/title/:title' do 

	content_type :json

	post = Post.find_by title: params[:title]
	if post.update params
		status 200
	else
		status 500
	end
end

# DELETE /////////////

delete '/api/post/title/:title' do

	content_type :json
	
	post = Post.find_by title: params[:title]
	if post.destroy
		status 200
		
	else
		status 500
		
	end
end