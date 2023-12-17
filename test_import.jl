using MAT

vars = matread("matfile.mat")
varnames = keys(vars)
println(varnames)
println(vars["Delta_eta"])
close(file)