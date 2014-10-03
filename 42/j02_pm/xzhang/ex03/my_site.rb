#! /usr/bin/env ruby

require 'sinatra'

get "/" do
	"<b>Hello world!</b>"
end

get "/cv" do
	"<b>Bienvenue sur votre CV</b>"
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
