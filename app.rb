# /usr/bin/env ruby
# Basically a super small app
require 'bundler/setup'
require 'sinatra'


set :public_folder, File.dirname(__FILE__) + '/public'

# Routes
get '/' do
	@title = "Jake and Sandy the Marriaging"
	erb :index, :layout => :splash
end

get '/about' do
	@title = "About Sandy & Jacob's Wedding"
	erb :about
end

helpers do
	def render(*args)
		if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
			return erb "#{args.first[:partial]}".to_sym, :layout => false
		else
			super
		end
	end
end
