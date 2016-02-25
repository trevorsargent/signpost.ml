require 'rubygems'
require 'bundler/setup'

Bundler.require

require './models/Sign'
require './models/User'
require './models/Post'
## Active Record

if ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  ActiveRecord::Base.establish_connection(
    :adapter  => 'sqlite3',
    :database => 'db/development.db',
    :encoding => 'utf8'
  )
end

get '/' do
	"please use signpostml/api to make api requests"
end



	get '/api/' do
		"Welcome to the api\n"
	end


	get '/api/signs' do
		content_type :json

		signs = Sign.all
		signs.to_json
	end 

	get '/api/signs/:id' do

		content_type :json

		sign = Sign.find params[:id]
		sign.to_json
	end

	post '/api/signs' do

		content_type :json

		sign = Sign.new params
		if sign.save
			status 201 #created
		else
			status 500 #error
		end

	end

	put '/api/signs/:id' do 

		content_type :json

		sign = Sign.find params[:id]
		if sign.update params[:sign]
			status 200
		else
			status 500
		end
	end


	delete '/api/signs/:id' do

		content_type :json

		sign = Sign.find params[:id]
		if sign.destroy
			status 200
		else
			status 500
		end
	end


	get '/api/users' do
		content_type :json

		users = User.all
		users.to_json
	end 

	get '/api/users/:id' do

		content_type :json

		user = User.find params[:id]
		user.to_json
	end

	get '/api/users/:id/signs' do
		content_type :json
		user = User.find params[:id]
		signs = user.signs.all
		signs.to_json

	end

	post '/api/users' do

		content_type :json

		user = User.new params
		if user.save
			status 201 #created
		else
			status 500 #error
		end

	end

	put '/api/users/:id' do 

		content_type :json

		user = User.find params[:id]
		if user.update params[:user]
			status 200
		else
			status 500
		end
	end


	delete '/api/users/:id' do

		content_type :json
		
		user = User.find params[:id]
		if user.destroy
			status 200
			
		else
			status 500
			
		end
	end

	get '/api/posts' do
		content_type :json

		posts = Post.all
		posts.to_json
	end 

	get '/api/posts/:id' do

		content_type :json

		post = Post.find params[:id]
		post.to_json
	end

	get '/api/posts/:id/signs' do
		content_type :json
		post = Post.find params[:id]
		signs = post.signs.all
		signs.to_json

	end

	post '/api/posts' do

		content_type :json

		post = Post.new params
		if post.save
			status 201 #created
		else
			status 500 #error
		end

	end

	put '/api/posts/:id' do 

		content_type :json

		post = Post.find params[:id]
		if post.update params[:post]
			status 200
		else
			status 500
		end
	end


	delete '/api/posts/:id' do

		content_type :json
		
		post = Post.find params[:id]
		if post.destroy
			status 200
			
		else
			status 500
			
		end
	end

