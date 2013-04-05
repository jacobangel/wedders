# /usr/bin/env ruby
# Basically a super small app
require 'bundler/setup'
require 'sinatra'


set :public_folder, File.dirname(__FILE__) + '/public'

BASE_TITLE = "Sandy & Jacob's Wedding"

# Routes
get '/' do
	@title = "Jake and Sandy the Marriaging | #{BASE_TITLE}"
	erb :index, :layout => :splash
end

get '/about' do
	@title = "About | #{BASE_TITLE}"
	erb :about
end

get '/details' do
    @title = "The Deets | #{BASE_TITLE}"
    erb :details
end

get '/who' do
    @title = "Major Players | #{BASE_TITLE}"
    erb :who
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
