# https://towardsdatascience.com/data-visualization-with-julia-and-vscode-168a69f7ddf8
import Pkg; Pkg.add("Plots")

using Plots

plot()
origin = (0,0)
a = 3
b = 4
c = 5
plot!([origin,(a,0)], label="a")
plot!([(a,0),(a,b)], label="b")
plot!([(a,b),origin], label="c")
