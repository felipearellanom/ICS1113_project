from gurobipy import Model, GRB, quicksum
from csv import DictReader
# modelo

model = Model()

J = 21
N = 12
T = 42

M = 10**4

# conjuntos

j_c = [x for x in range(1, J+1)]
i_c = [x for x in range(1, N+1)]
t_c = [x for x in range(T+1)]

# valores a editar para analisis de sensibilidad
# 0.5 para reducción de 50% 1.5 para aumento de 50%

# ponderador demanda_nueva
d_x = 1
# ponderador demanda_vieja
D_x = 1
# ponderador costo_fijo_compra
Z_x = 1
# ponderador precio_fruta_nueva
p_x = 1
# ponderador precio_fruta_vieja
P_x = 1

# parametros
with open("data/precio_fruta_nueva.csv", "r") as file:
    p = {int(first["fruta"]): float(first["precio"])*p_x
         for first in DictReader(file)}
with open("data/precio_fruta_vieja.csv", "r") as file:
    P = {int(first["fruta"]): float(first["precio"])*P_x
         for first in DictReader(file)}
with open("data/costo_fruta_almacen.csv", "r") as file:
    C = {int(first["fruta"]): int(first["costo"])
         for first in DictReader(file)}
with open("data/costo_compra_fruta.csv", "r") as file:
    Q = {int(first["fruta"]): int(first["costo"]) for first in DictReader(file)}
with open("data/demanda_nueva.csv", "r") as file:
    temp = {int(first["fruta"]): first for first in DictReader(file)}
    d = {i: {t: float(temp[i][f"V{t}"])*d_x for t in t_c[1:]} for i in i_c}
with open("data/demanda_vieja.csv", "r") as file:
    temp = {int(first["fruta"]): first for first in DictReader(file)}
    D = {i: {t: float(temp[i][f"V{t}"])*D_x for t in t_c[1:]} for i in i_c}
for i in i_c:
    D[i][1] = 0
with open("data/costo_fijo_compra.csv", "r") as file:
    Z = {int(first["fruta"]): float(first["costo"])*Z_x/220
         for first in DictReader(file)}
with open("data/limite_edad_nueva.csv", "r") as file:
    u = {int(first["fruta"]): int(first["dias"]) for first in DictReader(file)}
with open("data/limite_edad_compra.csv", "r") as file:
    U = {int(first["fruta"]): int(first["dias"]) for first in DictReader(file)}
with open("data/volumen_kilo.csv", "r") as file:
    V = {int(first["fruta"]): float(first["volumen"])
         for first in DictReader(file)}
with open("data/parametros_individuales.csv") as file:
    temp = {first["parametro"]: float(first["valor"])
            for first in DictReader(file)}
    k = temp["k"]
    A = temp["A"]
    K = temp["K"]
    B = temp["B"]
    E = temp["E"]
    H = temp["H"]*2
    S = temp["S"]
with open("data/initial_fruit.csv", "r") as file:
    temp = {int(first["fruta"]): first for first in DictReader(file)}
    o = {i: {j: float(temp[i][str(j)]) for j in j_c[:U[i]]} for i in i_c}
h = {i: {j: 0 for j in j_c[:U[i]]} for i in i_c}
q = {i: 0 for i in i_c}
g = {i: 0 for i in i_c}
Alpha = 0
a = {i: 0 for i in i_c}

# variables

O = model.addVars(i_c, j_c, t_c, vtype=GRB.CONTINUOUS, name="O")
n = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="n")
v = model.addVars(i_c, j_c, t_c, vtype=GRB.CONTINUOUS, name="v")
w = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="w")
r = model.addVars(i_c, t_c, vtype=GRB.INTEGER, name="r")
R = model.addVars(i_c, t_c, vtype=GRB.INTEGER, name="R")
b = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="b")
e = model.addVars(i_c, t_c, vtype=GRB.CONTINUOUS, name="e")
Beta = model.addVars(t_c, vtype=GRB.BINARY, name="Beta")
Gamma = model.addVars(i_c, t_c, vtype=GRB.BINARY, name="Gamma")
Lambda = model.addVars(t_c, vtype=GRB.BINARY, name="Lambda")
total = model.addVar(vtype=GRB.CONTINUOUS, name="total")
total_vieja = model.addVar(vtype=GRB.CONTINUOUS, name="totalVieja")
total_nueva = model.addVar(vtype=GRB.CONTINUOUS, name="totalNueva")
model.update()

# restricciones
for i in i_c:
    model.addConstrs((O[i, j, t] == O[i, j-1, t-1] - v[i, j-1, t-1]
                      for j in j_c[1:U[i]] for t in t_c[1:]),
                     name=f"ageFlow[{i}]")
    model.addConstrs((v[i, j, t] <= O[i, j, t] for j in j_c[:U[i]]
                      for t in t_c[1:]), name=f"finalAge[{i}]")

model.addConstrs((quicksum(v[i, j, t] for j in j_c[:u[i]]) <= d[i][t]
                  for i in i_c for t in t_c[1:]), name="newFruitDemand")

model.addConstrs((quicksum(v[i, j, t] for j in j_c[u[i]:U[i]]) <= D[i][t]
                  for i in i_c for t in t_c[1:]), name="oldFruitDemand")

model.addConstrs((quicksum(d[i][t] + D[i][t] -
                           quicksum(v[i, j, t] for j in j_c[:U[i]])
                           for i in i_c)
                  <= S for t in t_c[1:]), name="demandSatistfaction")

model.addConstrs((quicksum(O[i, j, t] for j in j_c[:u[i]]) * V[i]
                  <= K * r[i, t] for i in i_c for t in t_c[1:]),
                 name="newShelves")

model.addConstrs((quicksum(O[i, j, t] for j in j_c[u[i]:U[i]]) * V[i]
                  <= K * R[i, t] for i in i_c for t in t_c[1:]),
                 name="oldShelves")

model.addConstrs((quicksum(r[i, t] + R[i, t] for i in i_c)
                  == H for t in t_c[1:]),
                 name="totalShelves")

model.addConstrs((b[i, t] == b[i, t-1] - e[i, t-1] + O[i, U[i], t-1]
                  - v[i, U[i], t-1] for i in i_c for t in t_c[1:]),
                 name="garbageFlow")

model.addConstrs((M * Lambda[t] >= n[i, t-1] - n[i, t]
                  for i in i_c for t in t_c[1:]), name="fruitExtraction")

model.addConstrs((quicksum(n[i, t] * V[i] for i in i_c) <= A for t in t_c[1:]),
                 name="maxStorage")

model.addConstrs((quicksum(b[i, t] * V[i] for i in i_c) <= B for t in t_c[1:]),
                 name="maxGarbage")

model.addConstrs((w[i, t] <= Gamma[i, t] * M for i in i_c for t in t_c[1:]),
                 name="buyDecision")

model.addConstrs((n[i, t-1] >= (1-Gamma[i, t]) for i in i_c for t in t_c[1:]),
                 name="forceBuy")

model.addConstrs((n[i, t] == n[i, t-1] - O[i, 1, t] + w[i, t]
                  for i in i_c for t in t_c[1:]), name="storageFlow")

model.addConstrs((e[i, t] <= M * Beta[t]
                  for i in i_c for t in t_c[1:]), name="garbageDumpUpperBound")

model.addConstrs((e[i, t] <= b[i, t] for i in i_c for t in t_c[1:]),
                 name="maxGarbageDump")

model.addConstrs((b[i, t]-(1-Beta[t]) * M <= e[i, t]
                  for i in i_c for t in t_c[1:]), name="garbageDumpLowerBound")

model.addConstr((total ==
                 quicksum(quicksum(p[i] * quicksum(v[i, j, t]
                                                   for j in j_c[:u[i]]) +
                                   P[i] * quicksum(v[i, j, t]
                                                   for j in j_c[u[i]:U[i]])
                                   for i in i_c)
                          for t in t_c[1:])),
                name="totalGains")

model.addConstr((total_nueva == quicksum(
    quicksum(p[i] * quicksum(v[i, j, t] for j in j_c[:u[i]]) for i in i_c)
    for t in t_c[1:])), name="newFruitGains")

model.addConstr((total_vieja == quicksum(
    quicksum(P[i] * quicksum(v[i, j, t] for j in j_c[u[i]:U[i]]) for i in i_c)
    for t in t_c[1:])), name="oldFruitGains")

# valores iniciales
for i in i_c:
    model.addConstrs((O[i, j, 0] == o[i][j] for j in j_c[:U[i]]),
                     name=f"initialFruit[{i}]")
    model.addConstrs((v[i, j, 0] == h[i][j] for j in j_c[:U[i]]),
                     name=f"initialSales[{i}]")

model.addConstrs((b[i, 0] == q[i] for i in i_c), name="initialGarbage")
model.addConstrs((n[i, 0] == g[i] for i in i_c), name="initialStorage")
model.addConstrs((e[i, 0] == a[i] for i in i_c), name="initialGarbageDump")
model.addConstr(Beta[0] == Alpha, name="initialDumpDecision")

# funcion objetivo

obj = quicksum(quicksum(p[i] * quicksum(v[i, j, t] for j in j_c[:u[i]])
                        + P[i] * quicksum(v[i, j, t] for j in j_c[u[i]:U[i]])
                        - Q[i] * w[i, t]
                        - C[i] * n[i, t]
                        - Z[i] * Gamma[i, t]
                        for i in i_c)
               - E * Beta[t]
               - k * Lambda[t]
               for t in t_c[1:])
model.setObjective(obj, GRB.MAXIMIZE)
model.write("model.lp")

# optimizar
model.optimize()

# resultados
# model.printAttr("X")
vars = [(i, var) for i, var in enumerate(model.getVars())]
with open("holguras.txt", "w") as file:
    with open("antiholguras.txt", "w") as antifile:
        for x in model.getConstrs():
            if round(x.slack, 10) == 0:
                if x.sense != "=":
                    file.write(f"{x.ConstrName} {x.slack}\n")
            else:
                antifile.write(f"{x.ConstrName} {x.slack}\n")
with open("resultados.txt", "w") as file:
    file.write(f"{model.objVal}\n")
    for var in vars:
        if ("Beta" in var[1].varName or
                "Gamma" in var[1].varName) or "Lambda" in var[1].varName:
            file.write('%s %g' % (var[1].varName, var[1].x)+"\n")
        if "total" in var[1].varName:
            print('%s %g' % (var[1].varName, var[1].x)+"\n")
