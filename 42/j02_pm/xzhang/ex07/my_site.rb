#! /usr/bin/env ruby

require 'sinatra'

get "/" do
	erb :accueil

end

get "/cv" do
	erb :cv
end

get "/index/:name" do
	"#{params[:name]} aime les chips au fromage."
end

get "/blog" do
	erb :view
end

get "/blog/new" do
	erb :new
end
