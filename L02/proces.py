import matplotlib.pyplot as plt
import numpy as np
from scipy.integrate import solve_ivp

def model(t, stan, o, r, b):
    x, y, z = stan
    dxdt = o * y - o * x
    dydt = -x * z + r * x - y
    dzdt = x * y - b * z

    return [dxdt, dydt, dzdt]

# Param
o = 10
r = 28
b = 8/3

Wp = [0, 0.5, 1]
czas_sym = (0, 100)

sol = solve_ivp(
    model,
    czas_sym,
    Wp,
    args=(o, r, b)
)

x = sol.y[0]
y = sol.y[1]
z = sol.y[2]
t = sol.t

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.plot(x, y, z, label="Lorenz attractor")
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_title('Lorenz System')

plt.show()