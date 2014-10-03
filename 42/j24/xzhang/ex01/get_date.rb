#! /usr/bin/env ruby

time = Time.new

year = time.year.to_s
month = time.month.to_s
day = time.day.to_s

hour = time.hour.to_s
min = time.min.to_s
sec = time.sec.to_s

puts year+"-"+month+"-"+day + " " + hour + ":"+min + ":" + sec
