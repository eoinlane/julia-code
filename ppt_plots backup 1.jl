using Plots
origin = (0,0)
a = 3
b = 4
c = 5
plot!([origin,(a,0)], label="a")
plot!([(a,0),(a,b)], label="b")
plot!([(a,b),origin], label="c")
