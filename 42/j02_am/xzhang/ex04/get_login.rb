#! /usr/bin/env ruby

if ARGV.size ==2
	login = (ARGV[0][0]+ARGV[1][0..6]).downcase
	puts login

elsif ARGV.size ==0
	puts "Usage : ./get_login.rb Prenom Nom"
else
	puts "none"
end