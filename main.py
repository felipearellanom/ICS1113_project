from gurobipy import Model, GRB, quicksum

# modelo

model = Model()

J = 22
N = 12
T = 21

M = 10**10
valor = 18
valor2 = 21
# conjuntos

j_c = [x for x in range(1, J+1)]
i_c = [x for x in range(1, N+1)]
t_c = [x for x in range(T+1)]

# parametros
p = {i: valor2 for i in i_c}
P = {i: valor for i in i_c}
C = {i: valor for i in i_c}
k = 10
Q = {i: valor for i in i_c}
d = {i: {t: valor for t in t_c} for i in i_c}
D = {i: {t: valor for t in t_c} for i in i_c}
Z = {i: valor for i in i_c}
u = {i: valor for i in i_c}
U = {i: valor2 for i in i_c}
A = 10
K = 100
B = 10
E = 10
V = {i: 0 for i in i_c}
o = {i: {j: 0 for j in j_c[:U[i]]} for i in i_c}
h = {i: {j: 0 for j in j_c[:U[i]]} for i in i_c}
q = {i: 0 for i in i_c}
g = {i: 0 for i in i_c}
Alpha = 1
a = {i: 0 for i in i_c}
H = 10
S = 1

# variables

O = model.addVars(i_c, j_c, t_c, vtype=GRB.CONTINUOUS, name="O")
n = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="n")
b = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="b")
v = model.addVars(i_c, j_c, t_c, vtype=GRB.CONTINUOUS, name="v")
w = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="w")
r = model.addVars(i_c, t_c, vtype=GRB.INTEGER, name="r")
R = model.addVars(i_c, t_c, vtype=GRB.INTEGER, name="R")
e = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="e")
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
model.addConstrs((b[i, t] == b[i, t-1] - e[i, t-1] + O[i, U[i], t-1] -
                  v[i, U[i], t-1] for i in i_c for t in t_c[1:]), name="garbageFlow")
model.addConstrs((e[i, t] <= M * Beta[t]
                  for i in i_c for t in t_c[1:]), name="garbageDumpUpperBound")
model.addConstrs((e[i, t] <= b[i, t] for i in i_c for t in t_c[1:]), name="maxGarbageDump")
model.addConstrs((b[i, t]-(1-Beta[t]) * M <= e[i, t]
                  for i in i_c for t in t_c[1:]), name="garbageDumpLowerBound")
model.addConstrs((M * Lambda[t] >= n[i, t-1] - n[i, t]
                  for i in i_c for t in t_c[1:]), name="fruitExtraction")
model.addConstrs((quicksum(n[i, t] * V[i] for i in i_c) <= A for t in t_c[1:]), name="maxStorage")
model.addConstrs((quicksum(b[i, t] * V[i] for i in i_c) <= B for t in t_c[1:]), name="maxGarbage")
model.addConstrs((w[i, t] <= Gamma[i, t] * M for i in i_c for t in t_c[1:]), name="buyDecision")
model.addConstrs((O[i, 1, t] - w[i, t] == n[i, t] - n[i, t-1]
                  for i in i_c for t in t_c[1:]), name="storageFlow")

# valores iniciales
for i in i_c:
    model.addConstrs((O[i, j, 0] == o[i][j] for j in j_c[:U[i]]), name=f"initialFruit[{i}]")
    model.addConstrs((v[i, j, 0] == h[i][j] for j in j_c[:U[i]]), name=f"initialSales[{i}]")

model.addConstrs((b[i, 0] == q[i] for i in i_c), name="initialGarbage")
model.addConstrs((n[i, 0] == g[i] for i in i_c), name="initialStorage")
model.addConstrs((e[i, 0] == a[i] for i in i_c), name="initialGarbageDump")
model.addConstr(Beta[0] == Alpha, name="initialDumpDecision")

# funcion objetivo

obj = quicksum(quicksum(p[i] * quicksum(v[i, j, t] for j in j_c[:u[i]+1]) + P[i] * quicksum(v[i, j, t] for j in j_c[u[i]:U[i]]
                                                                                            ) - Q[i] * w[i, t] - C[i] * n[i, t] - Z[i] * Gamma[i, t] for i in i_c) - E * Beta[t] - k * Lambda[t] for t in t_c[1:])
model.setObjective(obj, GRB.MAXIMIZE)
model.write("model.lp")

# optimizar
model.optimize()

# resultados
# model.printAttr("X")
vars = [(i, var) for i, var in enumerate(model.getVars())]
for var in vars:
    if var[1].x != 0:
        print(var[0], '%s %g' % (var[1].varName, var[1].x))
