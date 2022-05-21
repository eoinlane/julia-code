### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ 254176ff-8efc-4973-84be-272af6ef0845
md"""
https://en.wikipedia.org/wiki/Division_algorithm
"""

# ╔═╡ f5462ac8-6299-11ec-29b6-0d0f8c7a2b7a
function remainder(n,d)
	r = n
	c=0
	while r >= d 
		r = r - d
		c += 1
	end
	return r
end

# ╔═╡ 96f54b1d-a879-4c19-932e-f2cdc0d2a30f


# ╔═╡ 77bdde3d-b9ef-4c02-91be-05da70894c71
remainder(132,36)

# ╔═╡ b94517a3-bade-4b8a-8608-9ac80b4bfdd2


# ╔═╡ 0f2a2e48-150c-435c-9ba8-ac901163f819
remainder(36,24)

# ╔═╡ 32661991-ae2b-4686-9c4f-65894f747dfa
remainder(24,12)

# ╔═╡ 57d15fe9-47ef-4dd2-a5e9-70cdfaf680b0
remainder(22,60)

# ╔═╡ 2f32087d-5c14-494b-9dc6-dbe7bb460fca


# ╔═╡ ce1797fc-849d-4241-b623-487c51ae2c7b
md"""
https://www.geeksforgeeks.org/recursive-functions/
"""

# ╔═╡ e0d10c1a-6c13-4d37-9a30-377d6c7a0eb4
md"""
$A= Q\times B + R.$
Then at the next step we replace our old A and
continue the process until
B with the numbers B and R and
we get a remainder of 0. At that point, the remainder R
from the previous step is the greatest common divisor of our original two numbers.
"""

# ╔═╡ 8878c821-29d5-4162-8cf5-72a30c24c6c9
function gcd(n,d)
	r = n
	#c = 0
	while r >= d 
		r = r - d
		#c += 1
	end
	if r == 0
        return d
	end
	gcd(d,r)
end 

# ╔═╡ 996ae91b-17a2-4dbb-9442-603b712e997e
gcd(132,36)

# ╔═╡ 69cd64dd-569e-4258-ac23-62e44f4dd402
gcd(60,22)

# ╔═╡ 6e4d5111-0456-4a25-8e63-6e0849f0a599
gcd(12453,2347)

# ╔═╡ 45c32077-f71b-4c6a-ba76-8407ff43bbb7
md"""
Method to Compute $Q$ and Ron a Calculator So That $A= B\times Q + R$
1. Use the calculator to divide $A$ by $B$. You get a number with decimals.
2. Discard all the digits to the right of the decimal point. This gives $Q$.
3. To find R, use the formula $R =A-B\times Q$.
"""

# ╔═╡ 5fcc60fb-8b9d-4f02-b943-e87784a71bcf


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─254176ff-8efc-4973-84be-272af6ef0845
# ╠═f5462ac8-6299-11ec-29b6-0d0f8c7a2b7a
# ╠═96f54b1d-a879-4c19-932e-f2cdc0d2a30f
# ╠═77bdde3d-b9ef-4c02-91be-05da70894c71
# ╠═b94517a3-bade-4b8a-8608-9ac80b4bfdd2
# ╠═0f2a2e48-150c-435c-9ba8-ac901163f819
# ╠═32661991-ae2b-4686-9c4f-65894f747dfa
# ╠═57d15fe9-47ef-4dd2-a5e9-70cdfaf680b0
# ╠═2f32087d-5c14-494b-9dc6-dbe7bb460fca
# ╟─ce1797fc-849d-4241-b623-487c51ae2c7b
# ╠═e0d10c1a-6c13-4d37-9a30-377d6c7a0eb4
# ╠═8878c821-29d5-4162-8cf5-72a30c24c6c9
# ╠═996ae91b-17a2-4dbb-9442-603b712e997e
# ╠═69cd64dd-569e-4258-ac23-62e44f4dd402
# ╠═6e4d5111-0456-4a25-8e63-6e0849f0a599
# ╠═45c32077-f71b-4c6a-ba76-8407ff43bbb7
# ╠═5fcc60fb-8b9d-4f02-b943-e87784a71bcf
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
