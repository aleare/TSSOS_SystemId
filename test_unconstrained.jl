using TSSOS
using DynamicPolynomials
@polyvar x[1:3]
f = 1 + x[1]^4 + x[2]^4 + x[3]^4 + x[1]*x[2]*x[3] + x[2]
opt,sol,data = tssos_first(f, x, TS="MD")
