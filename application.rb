require 'sinatra'
require 'sinatra/json'
require 'bundler'



Bundler.require
require './lib/signpost'

# Datamapper

DataMapper.setup(:default, 'sqlite::memory')

DataMapper.finalize
DataMapper.auto_migrate!

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

	signpost = Signpost.get params[:id]
	signpost.to_json
end

post '/signposts' do

	content_type :json

	signpost = Signpost.new params[:signpost]
	if signpost.save
		status 201 #created
	else
		status 500 #error
		json signpost.errors.full_messages
	end

end

put '/signposts/:id' do 

	content_type :json

	signpost = Signpost.get params[:id]
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

	signpost = Signpost.get params[:id]
	if signpost.destroy
		status 200
		json "signpost was removed"
	else
		status 500
		json "There was a problem removing the signpost"
	end
end



