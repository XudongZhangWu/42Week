#! /usr/bin/env ruby

codePin=0

#puts 

while codePin < 10000 do
	s = codePin.to_s.rjust(4, '0')
	s = s.to_s

	retour_console = `./secu-phone #{s}`

	
	if retour_console.include? "OK"
		puts codePin
		break
	end 
	codePin +=1
end

