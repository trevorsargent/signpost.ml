require 'rubygems'
require 'bundler/setup'

Bundler.require

require './models/Signpost'
require './models/User'

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
	"please use signpost.ml/api to make api requests"
end



	get '/api/' do
		"Welcome to the api\n"
	end


	get '/api/signposts' do
		content_type :json

		signposts = Sign.all
		signposts.to_json
	end 

	get '/api/signposts/:id' do

		content_type :json

		signpost = Sign.find params[:id]
		signpost.to_json
	end

	post '/api/signposts' do

		content_type :json

		signpost = Sign.new params
		if signpost.save
			status 201 #created
		else
			status 500 #error
			json signpost.errors.full_messages
		end

	end

	put '/api/signposts/:id' do 

		content_type :json

		signpost = Sign.find params[:id]
		if signpost.update params[:signpost]
			status 200
			json "signpost was updated"
		else
			status 500
			json signpost.errors.full_messages
		end
	end


	delete '/api/signposts/:id' do

		content_type :json

		signpost = Sign.find params[:id]
		if signpost.destroy
			status 200
			json "signpost was removed"
		else
			status 500
			json "There was a problem removing the signpost"
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



	get '/api/users/:id/signposts' do
		content_type :json
		user = User.find params[:id]
		signposts = user.signs.all
		signposts.to_json

	end

	post '/api/users' do

		content_type :json

		user = User.new params
		if user.save
			status 201 #created
		else
			status 500 #error
			json user.errors.full_messages
		end

	end

	put '/api/users/:id' do 

		content_type :json

		user = User.find params[:id]
		if user.update params[:user]
			status 200
			json "user was updated"
		else
			status 500
			json user.errors.full_messages
		end
	end


	delete '/api/users/:id' do

		content_type :json
		
		user = User.find params[:id]
		if user.destroy
			status 200
			json "user was removed"
		else
			status 500
			json "There was a problem removing the user"
		end
	end


