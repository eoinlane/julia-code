# https://www.geeksforgeeks.org/recursive-functions/

function gcd(n,d)
	r = n
	c = 0
	while r >= d 
		r = r - d
		c += 1
	end
	if r == 0
        return d
	end
	gcd(d,r)
end 

gcd(132,36)