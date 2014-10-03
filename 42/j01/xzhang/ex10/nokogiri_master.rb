#! /usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

if ARGV.size >0

ARGV.each do |x|

begin
    page = Nokogiri::HTML open(x)
    puts page.xpath("//title").text

rescue
    puts "Couldn't read " +"\"" +x +"\"" 
    
    
end

end
else puts "none"
end