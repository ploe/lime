filthy = Crew {
	update = function(self)
		print("I was made in Lua")
		return "PAUSE"
	end
}

function filthy:animate()
	puts("crazee")
end

--[[myke = Actor {
	animate = "LOL"
}]]

daisy = Actor {
	tag = "daisy chane",
	costume = "daisy-flat.png",
	w = 100,
	h = 100,
	ticks = 0,
	frame = 1,
	reel = 1,
	visible = true,
	x = 100,
	y = 200,
	vector = 10
}

brum = Actor {
	tag = "butthead",
	costume = "brum.png",
	visible = true,
	w = 200,
	h = 200,
	x = 0,
	y = 400
}

function brum:animate()
	if self.reel ~= 2 then self:jumpreel(2) end
	if self.ticks == 20 then
		if self.frame == 1 then self:nextclip() 
		elseif self.frame == 2 then
			self:prevclip()
			self.frame = 1
		end
	end
	return self.animate
end

print(daisy.costume)
print(daisy.w)
print(daisy.h)
print(daisy.tag)


function daisy:animate()
	return self.run	
end

-- Don't want to divide by zero...
function is_even(n)
	if (n ~= 0) and ((n % 2) == 0) then return true end
	return false
end

--[[ maybe self.ticks can be incremented in C, that way we don't have to
add it up in Lua which removes a little more of the boilerplate bullshit

nextclip, prevclip and jumpclip could all increment the frame counter 
which again removes a little more of the boilerplate stuff. ]]

function daisy:boil()
	if self.reel ~= 0 then self:jumpreel(0) end

	if self.ticks == 3 then
		if (is_even(self.frame)) then self:prevclip()
		else self:nextclip() end
	end
	self.x = self.x - self.vector

	return self.boil
end

-- jumpreel should take care of handling the resetting of the values frame, clip and reel
-- perhaps I should call it setreel? Shorter... though the word jumpreel looks more... right!

function daisy:run()
	if self.reel ~= 1 then self:jumpreel(1) end

	if self.ticks == 3 then
		if self.frame == 1 
		or self.frame == 2 then
			self:nextclip()
		elseif self.frame == 3
		or self.frame == 4 then
			self:prevclip()
		end

		if self.frame == 5 then self.frame = 1 end
	end
	self:focus()
	self.x = self.x - self.vector
	if self.x < -100 or self.x > 1366 then self.vector = -self.vector end

	return self.run	
end

