from gurobipy import Model, GRB, quicksum

# modelo

model = Model()

J = 7
N = 1
T = 10

valor = 2
valor2 = 5
# conjuntos

j_c = [x for x in range(1, J+1)]
i_c = [x for x in range(1, N+1)]
t_c = [x for x in range(T+1)]
# parametros
p = {i: valor for i in i_c}
P = {i: valor for i in i_c}
C = {i: valor for i in i_c}
k = 1
Q = {i: valor for i in i_c}
d = {i: {t: valor for t in t_c} for i in i_c}
D = {i: {t: valor for t in t_c} for i in i_c}
Z = {i: valor for i in i_c}
u = {i: valor for i in i_c}
U = {i: valor2 for i in i_c}
A = 1
K = 1
B = 1
E = 1
V = {i: valor for i in i_c}
o = {i: {j: valor for j in j_c[:U[i]]} for i in i_c}
h = {i: {j: valor for j in j_c[:U[i]]} for i in i_c}
q = {i: valor2 for i in i_c}
g = {i: valor2 for i in i_c}
Alpha = 1
H = 1
S = 1

# variables

O = model.addVars(i_c, j_c, t_c, vtype=GRB.CONTINUOUS, name="O")
n = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="n")
b = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="b")
v = model.addVars(i_c, j_c, t_c, vtype=GRB.CONTINUOUS, name="v")
w = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="w")
r = model.addVars(i_c, t_c, vtype=GRB.INTEGER, name="r")
R = model.addVars(i_c, t_c, vtype=GRB.INTEGER, name="R")
Beta = model.addVars(t_c, vtype=GRB.BINARY, name="Beta")
Gamma = model.addVars(i_c, t_c, vtype=GRB.BINARY, name="gamma")
Lambda = model.addVars(t_c, vtype=GRB.BINARY, name="Lambda")
model.update()

# restricciones
for i in i_c:
    model.addConstrs((O[i, j, t] == O[i, j-1, t-1] - v[i, j-1, t-1]
                      for j in j_c[1:U[i]] for t in t_c[1:]), name=f"ageFlow[{i}]")
model.addConstrs((quicksum(v[i, j, t] for j in j_c[:u[i]]) <= d[i][t]
                  for i in i_c for t in t_c[1:]), name="newFruitDemand")
model.addConstrs((quicksum(v[i, j, t] for j in j_c[u[i]:U[i]]) <= D[i][t]
                  for i in i_c for t in t_c[1:]), name="oldFruitDemand")
model.addConstrs((quicksum(quicksum(v[i, j, t] for j in j_c[:U[i]]) - d[i][t] - D[i][t]
                           for i in i_c) <= S for t in t_c[1:]), name="demandSatistfaction")
model.addConstrs((quicksum(O[i, j, t] for j in j_c[:u[i]]) * V[i]
                  <= K * r[i, t] for i in i_c for t in t_c[1:]), name="newShelves")
model.addConstrs((quicksum(O[i, j, t] for j in j_c[u[i]:U[i]]) * V[i]
                  <= K * R[i, t] for i in i_c for t in t_c[1:]), name="oldShelves")
model.addConstrs((quicksum(r[i, t]+R[i, t] for i in i_c) <=
                  H for t in t_c[1:]), name="totalShelves")
model.addConstrs((b[i, t] == b[i, t-1] * (1 - Beta[t-1]) + O[i, U[i], t-1] -
                  v[i, U[i], t-1] for i in i_c for t in t_c[1:]), name="garbageFlow")  # graaaaaaaave no es lineal

# funcion objetivo

obj = quicksum(quicksum(p[i] * quicksum(v[i, j, t] for j in j_c[:u[i]+1]) + P[i] * quicksum(v[i, j, t] for j in j_c[u[i]:U[i]]
                                                                                            ) - Q[i] * w[i, t] - C[i] * n[i, t] - Z[i] * Gamma[i, t] for i in i_c) - E * Beta[t] - k * Lambda[t] for t in t_c[1:])
model.setObjective(obj, GRB.MAXIMIZE)
model.write("model.lp")

# optimizar


# resultados
