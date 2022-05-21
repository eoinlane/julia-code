using Plots

plot()
origin = (0,0)
a = 10
plot!([origin,(a,0)], label="a")
plot!([(a,0),(a,a)], label="a")
plot!([(a,a),(0,a)], label="a")
plot!([(0,a),origin], label="a")
