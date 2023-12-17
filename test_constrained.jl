using TSSOS
using DynamicPolynomials

@polyvar x[1:3] #define x1 x2 x3 as poly opt vars
f = 1+x[1]^4+x[2]^4+x[3]^4+x[1]*x[2]*x[3]+x[2] #cost function 
g_1 = 1-x[1]^2-2*x[2]^2 #uneq constraint
g_2 = x[2]^2+x[3]^2-1 #eq constraint
pop = [f, g_1, g_2]
d = 2 # set the relaxation order
#numeq=number of equations
#term sparsity: idk
opt,sol,data = tssos_first(pop, x, d, numeq=1, TS="MD")
