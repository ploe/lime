filthy = Crew {
	update = function(self)
		print("I was made in Lua")
		return "PAUSE"
	end
}

function filthy:animate()
	puts("crazee")
end

myke = Actor {
	animate = "LOL"
}

daisy = Actor {
	tag = "daisy chane",
	costume = "daisy-flat.png",
	w = 100,
	h = 100
}

print(daisy.costume)
print(daisy.w)
print(daisy.h)
print(daisy.tag)

function myke:cough()
	print("cough")
end
