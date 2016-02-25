require 'rubygems'
require 'bundler/setup'

Bundler.require
require './models/Signpost'

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
	"Hello World\n"
end


get '/signposts' do
	content_type :json

	signposts = Signpost.all
	signposts.to_json
end 

get '/signposts/:id' do

	content_type :json

	signpost = Signpost.find params[:id]
	signpost.to_json
end

post '/signposts' do

	content_type :json

	signpost = Signpost.new params
	if signpost.save
		status 201 #created
	else
		status 500 #error
		json signpost.errors.full_messages
	end

end

put '/signposts/:id' do 

	content_type :json

	signpost = Signpost.find params[:id]
	if signpost.update params[:signpost]
		status 200
		json "signpost was updated"
	else
		status 500
		json signpost.errors.full_messages
	end
end


delete '/signposts/:id' do

	content_type :json

	signpost = Signpost.find params[:id]
	if signpost.destroy
		status 200
		json "signpost was removed"
	else
		status 500
		json "There was a problem removing the signpost"
	end
end


get '/users' do
	content_type :json

	users = User.all
	users.to_json
end 

get '/users/:id' do

	content_type :json

	user = User.get params[:id]
	user.to_json
end

post '/users' do

	content_type :json

	user = User.new params
	if user.save
		status 201 #created
	else
		status 500 #error
		json user.errors.full_messages
	end

end

put '/users/:id' do 

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


delete '/users/:id' do

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

