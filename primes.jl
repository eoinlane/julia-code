using DataFrames

function primeFactors(number, list = Int[] )
    for n in 2:number 
		if (number % n == 0)
			return primeFactors(number / n, push!(list, n))
		end
	end
	list
end
#df = DataFrame(A = 1:30, B = map(primeFactors, 1:30))


#= For each remaining factor p:
if p=2, u = (1 + i).   
	strike p from the list of remaining primes.
 else if p mod 4 = 3, q = p, and strike 2 copies of p from the list of primes.
 else find k such that k^2 = -1 mod p, then u = gcd(p, k+i)
	 if G/u has remainder 0, q = u
	 else q = conjugate(u)
	 strike p from the list of remaining primes.
 Add q to the list of Gaussian factors.
 Replace G with G/q.
endfor
=#
# https://github.com/JuliaLang/julia/issues/35125
function gcd1(a::Complex{T}, b::Complex{V}) where {T<:Integer,V<:Integer}
    R = promote_type(T, V)
    x, r = Complex{R}(a), Complex{R}(b)
    while r != 0
        x, r = r, rem(x, r)
    end
    return first_quadrant(x)
end

function gcd(z1::Complex{T}, z2::Complex{V}) where {T<:Integer, V<:Integer}
    R = promote_type(T, V)
    a = Complex{R}(z1)
    b = Complex{R}(z2)
    if abs(a) < abs(b)
        a, b = b, a
    end
    while b != 0
        # TODO: Create rem(::Complex{<:Integer}, ::Complex{<:Integer})
        # TODO: Create div(::Complex{<:Integer}, ::Complex{<:Integer})
        b̅ = conj(b)
        # TODO: Handle overflow when calculating a*b̅
        t = a*b̅
        # TODO: Create checked_abs2(::Complex{<:Integer})
        # TODO: Handle overflow when calculating the norm of complex numbers
        abs2_b = abs2(b)
        abs2_b < 0 && __throw_gcd_overflow(z1, z2)
        r = a - b * complex(div(real(t), abs2_b, RoundNearest),
                            div(imag(t), abs2_b, RoundNearest))
        a = b
        b = r
    end
    ar, ai = reim(a)
    if ar == 0
        complex(abs(ai), zero(ar))
    elseif ai == 0
        complex(abs(ar), zero(ai))
    elseif ar>0 && ai>=0   # gcd is already in first quadrant
        a
    elseif ar<0 && ai>0     # In second quadrant
        complex(ai, -ar)
    elseif ar<0 && ai<0     # In third quadrant
        -a
    else                               # In fourth quadrant
        complex(-ai, ar)
    end
end

#= 
Considering 5, we see it is congruent to 1 mod 4. We need to find a good k. 
Trying n=2, n^(p-1)/2 mod p = 2^2 mod p = 4. 4 is congruent to -1 mod 5. 
Success! k = 2^1 = 2. u = gcd(5, 2+i) which works out to be 2+i. 
G/u = -494 - 285i, with remainder 0, so we find q = 2+i.

For a positive integer n, two integers a and b are said to be congruent modulo n (or a is congruent to b modulo n), 
if a and b have the same remainder when divided by n (or equivalently if a − b is divisible by n ). 
It can be expressed as a ≡ b mod n. n is called the modulus.
=#

# https://en.wikipedia.org/wiki/Table_of_Gaussian_integer_factorizations

dict = Dict()

function gprime(arr)
	x = Complex[]
	for p in arr
		if p == 2 
			push!(x,1 + 1im)
            push!(x,1 - 1im)
		elseif mod(p,4) == 3 # p = 3 mod 4, q = p.
			push!(x,p)
		elseif mod(p, 4) == 1 # p = 1 mod 4 
            if haskey(dict, p)
                push!(x,dict[p])
            end
			for k in 2:(p-1)
				if mod(mod(k^((p-1)/2),p),p) == mod(-1,p)
                    factor = gcd(Complex(p), Int(k^((p-1)/4)) +1im)
                    if !in(factor, x) 
                        factor_complex_cong = conj(factor)
					    push!(x,factor)
                        push!(x,factor_complex_cong)
                        dict[p] = factor
                        break
                    end
				end
			end
		end
	end
	x
end

df = DataFrame(A = 1:30, B = map(primeFactors, 1:30), C= map(gprime, map(primeFactors, 1:30)))

#map(gprime, [17])

#gcd(Complex(17), 13+1im) 

#vscode://vscode.github-authentication/did-authenticate?windowid=1&code=b5438244d4a4c9ddf497&state=e973d2b5-7c7e-4843-a8c6-5588d381bf84 

using Plots

function circleShape(h,k,r)
    θ = LinRange(0, 2π, 500)
    h .+ r*sin.(θ), .+ r*cos.(θ)  
end

limits = 8
x0 = [2, 1]
y0 = [2, -1]
plot(x0, y0, seriestype = :scatter, xlims = (-limits, limits), ylims = (-limits, limits), title = "Fig 1 Argand diagram", label = false, showaxis = false, )
plot!([(-limits, 0), (limits, 0)])
plot!([(0, -limits), (0, limits)])
plot!([(0, 0), (2, 1)], label = "vector (2,1)")
plot!([(0, 0), (2, -1)], label = "vector (2,-1)")
plot!([(0, 0), (1, 2)], label = "vector (1,2)")
plot!([(0, 0), (1, -2)], label = "vector (1,-2)")
for i in 1:30
    if mod(i,5) == 1
        plot!(circleShape(0,0,sqrt(i)))
    end
end
#plot!(circleShape(0,0,sqrt(13)))
#plot!(circleShape(0,0,sqrt(25)))
#plot!(circleShape(0,0,sqrt(37)))