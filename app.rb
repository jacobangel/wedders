# /usr/bin/env ruby
# Basically a super small app
require 'bundler/setup'
require 'sinatra'


set :public_folder, File.dirname(__FILE__) + '/public'
set :views, ['views/partials', 'views/pages', 'views/layouts', 'views']

BASE_TITLE = "Sandy & Jacob's Wedding"

# Routes
get '/' do
	@title = "Jake and Sandy the Marriaging | #{BASE_TITLE}"
    @body_class = "page-home"
	erb :index, :layout => :splash
end

get '/about' do
	@title = "About | #{BASE_TITLE}"
    @body_class = "page-about"
	erb :about
end

get '/details' do
    @title = "The Deets | #{BASE_TITLE}"
    @body_class = "page-details"
    erb :details
end

get '/who' do
    @title = "Major Players | #{BASE_TITLE}"
    @body_class = "page-who"
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
    def find_template(views, name, engine, &block)
        Array(views).each { |v| super(v, name, engine, &block) }
    end
end
