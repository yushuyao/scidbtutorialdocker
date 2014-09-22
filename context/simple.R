library(scidb)

scidbconnect()

# Create a SciDB array with some random entries
iquery("store(build(<v:double>[i=0:999,100,0,j=0:999,250,0],random()%100),A)")

# The SciDBR `image` function overloads the usual R image function to produce
# heatmaps using SciDB's `regrid` aggregation operator. The 'grid' argument
# specifies the output array size, and the 'op' argument specifies the
# aggregation operator to apply.

A <- scidb('A')
X = image(A, grid=c(100,100), op="avg(v)", useRaster=TRUE)
