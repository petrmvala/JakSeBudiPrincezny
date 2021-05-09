# Zakladni pokus


```@setup plots
using Plots
```

The [Plots](https://github.com/JuliaPlots/Plots.jl) package is not a standard plotting package known from other languages. The Plots package provides a unified interface and toolset for creating plots. The plots themselves are drawn by different [backends](http://docs.juliaplots.org/latest/backends/), like GR, PyPlot, PGFPlotsX, or Plotly. If one backend does not support desired features, it is possible to switch to another backend with one command without any further changes to the code.

!!! warning "Time for the first plot"
Compared to Python or Matlab, it takes some time to create the first plot in a new Julia session. In Julia, all functions are compiled during their first run, which slows the first run down.

The core of the Plots package is the `plot` function that provides an interface for creating all types of plots. The default plot style is the line style. The line plot can be created by calling the plot function on two vectors.

```@example plots
using Plots
x = range(0, 2π; length = 100)
y = sin.(x)
plot(x, y)
```
