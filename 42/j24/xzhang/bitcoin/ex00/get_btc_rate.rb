#! /usr/bin/env ruby

require 'json'


user_token = "fNSh9Wbb2nLrbPzxv3G6"

address = "http://91.121.146.64/value.json?user_token=#{user_token}"


response = `curl -s #{address}`

puts JSON.parse(response)["current"]