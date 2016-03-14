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

put '/api/posts/:id' do 

	content_type :json

	post = Post.find params[:id]
	if post.update params[:post]
		status 200
	else
		status 500
	end
end

# DELETE /////////////

delete '/api/posts/:id' do

	content_type :json
	
	post = Post.find params[:id]
	if post.destroy
		status 200
		
	else
		status 500
		
	end
end