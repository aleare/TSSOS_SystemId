<<<<<<< HEAD
using MAT

vars = matread("matfile.mat")
varnames = keys(vars)
println(varnames)
println(vars["Delta_eta"])
=======
using MAT

vars = matread("matfile.mat")
varnames = keys(vars)
println(varnames)
println(vars["Delta_eta"])
>>>>>>> 036cf96c2e13a58881bca4537ae268f7a91d29ce
close(file)