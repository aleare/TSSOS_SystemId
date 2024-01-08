using TSSOS
using DynamicPolynomials
using MAT
using Printf

theta0=[-0.7647,0.3012,0,32.24,21.41];
println(theta0)
println("Obtaining data from matlab")

vars = matread("test2.mat");
varnames = keys(vars);
print("Got: ")
println(varnames)
N=convert(Int64, vars["N"])
@printf("N: %d\n",N)
delta_epsilon=vars["Delta_epsilon"]
@printf("Delta Epsilon: %f\n",delta_epsilon)
delta_eta=vars["Delta_eta"]
@printf("Delta Eta: %f\n",delta_eta)
u_tilde=vars["u_tilde"];
y=vars["y"];

N=20

@polyvar theta[1:5];
@polyvar e[1:N];
@polyvar eta[1:N];

start=3;

#test: PUI_1 min
f=theta[1]
g=[];

for i=1:N
    if(delta_eta!=0)
        push!(g,eta[i]+delta_eta);
        push!(g,-eta[i]+delta_eta);
    end
    if(delta_epsilon!=0)
        push!(g,e[i]+delta_epsilon);
        push!(g,-e[i]+delta_epsilon);
    end
end
for i=start:N
    push!(g, y[i] + theta[1]*y[i-1] + theta[2]*y[i-2] +
     theta[3]*u_tilde[i] + theta[4]*u_tilde[i-1] + theta[5]*u_tilde[i-2] -
     eta[i]+ theta[1]*eta[i-1] + theta[2]*eta[i-2] +
     theta[3]*e[i] + theta[4]*e[i-1] + theta[5]*e[i-2])
end
pop = g;
pushfirst!(pop,f);
@printf("\n\n\n")
#debug
print(length(pop))
print("Numeq:")
println(N-start+1)
println("-")
println(pop)
println("-")
println( [theta;e;eta])
d = 2; # set the relaxation order
println("Starting POP via TSSOS")
opt,sol,data = tssos_first(pop, [theta;e;eta], d, numeq=N-start+1, TS="MD", solution=true, quotient=false)
println(opt)
println(sol)
println(data)
