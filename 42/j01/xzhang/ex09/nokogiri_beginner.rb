#! /usr/bin/env ruby

require 'open-uri'
require 'nokogiri'


if ARGV.size >0

begin
    page = Nokogiri::HTML open(ARGV[0])
    puts "OK"

rescue
    puts "KO"
    
    
end

else puts "none"
end