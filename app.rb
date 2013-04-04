# /usr/bin/env ruby
# Basically a super small app
require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'

# Routes
get '/' do
	erb :index
end


