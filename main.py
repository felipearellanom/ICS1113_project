from guropipy import Model, GRB

# modelo
model = Model()


# parametros


# variables
Ojit = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
nit = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
bit = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
vijt = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
wit = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
rit = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
Rit = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
beta = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
gamma = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 
lambda = model.addVars(edad, variedad, tiempo, vtype=GRB.INTEGER, name="Ojit") 

# restricciones


# funcion objetivo


# optimizar


# resultados


