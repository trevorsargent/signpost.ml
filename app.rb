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


#////////#
# ROUTES #
#////////#

# ROOT

get '/' do
	"please use signpostml/api to make api requests"
end

# API ROOT

get '/api/' do
	"Welcome to the api\n"
end

require './includes/sign_routes.rb'
require './includes/user_routes.rb'
require './includes/post_routes.rb'

