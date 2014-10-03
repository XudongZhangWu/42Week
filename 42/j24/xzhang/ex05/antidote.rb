#! /usr/bin/env ruby

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

if ARGV.size < 2
	puts "none"
else
	bool = true

	if ARGV[0].is_integer?
		somme = ARGV[0].to_i
	end

	ARGV.each do |x|
		if x.is_integer?
			if x.to_i > somme
				somme = x.to_i
			end
		else 
			bool = false
			break
		end
	end

	if bool
		puts somme.to_s
	else 
		puts "none"
	end
end