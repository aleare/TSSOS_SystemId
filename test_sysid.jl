<<<<<<< HEAD
using TSSOS
using DynamicPolynomials
using MAT

theta0=[-0.7647,0.3012,0,32.24,21.41];
println(theta0)
println("Obtaining data from matlab")

vars = matread("matfile.mat");
varnames = keys(vars);
print("Got: ")
println(varnames)
delta_e=vars["Delta_epsilon"]
delta_eta=vars["Delta_eta"]
u_tilde=vars["u_tilde"];
y=vars["y"];

@polyvar theta[1:5];
@polyvar e[1:100];
@polyvar eta[1:100];

start=3;
Ni=30;

#test: PUI_1 min
f=theta[1]
g=[];
for i=start:Ni
    push!(g, y[i] + theta[1]*y[i-1] + theta[2]*y[i-2] +
     theta[3]*u_tilde[i] + theta[4]*u_tilde[i-1] + theta[5]*u_tilde[i-2] -
     eta[i]+ theta[1]*eta[i-1] + theta[2]*eta[i-2] +
     theta[3]*e[i] + theta[4]*e[i-1] + theta[5]*e[i-2])
end
pop = g;
pushfirst!(pop,f);
d = 2; # set the relaxation order
println("Startting POP via TSSOS")
opt,sol,data = tssos_first(pop, [theta;e;eta], d, numeq=length(g), TS="MD", quotient=false)
println(opt)
println(sol)
println(data)
=======
using TSSOS
using DynamicPolynomials
using MAT

theta0=[-0.7647,0.3012,0,32.24,21.41];
println(theta0)
println("Obtaining data from matlab")

vars = matread("matfile.mat");
varnames = keys(vars);
print("Got: ")
println(varnames)
delta_e=vars["Delta_epsilon"]
delta_eta=vars["Delta_eta"]
u_tilde=vars["u_tilde"];
y=vars["y"];

@polyvar theta[1:5];
@polyvar e[1:100];
@polyvar eta[1:100];

start=3;
Ni=30;

#test: PUI_1 min
f=theta[1]
g=[];
for i=start:Ni
    push!(g, y[i] + theta[1]*y[i-1] + theta[2]*y[i-2] +
     theta[3]*u_tilde[i] + theta[4]*u_tilde[i-1] + theta[5]*u_tilde[i-2] -
     eta[i]+ theta[1]*eta[i-1] + theta[2]*eta[i-2] +
     theta[3]*e[i] + theta[4]*e[i-1] + theta[5]*e[i-2])
end
pop = g;
pushfirst!(pop,f);
d = 2; # set the relaxation order
println("Startting POP via TSSOS")
opt,sol,data = tssos_first(pop, [theta;e;eta], d, numeq=length(g), TS="MD", quotient=false)
println(opt)
println(sol)
println(data)
>>>>>>> 036cf96c2e13a58881bca4537ae268f7a91d29ce
