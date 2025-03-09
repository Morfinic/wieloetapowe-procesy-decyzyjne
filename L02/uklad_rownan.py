import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Definicja modelu, liczenie zmiany w czasie
def model(t, stan, a, b, c, d):
    x, y = stan
    dxdt = x * (a - b * y)
    dydt = y * (-d + c * x)

    return [dxdt, dydt]

# Parametry
a = 0.5 # tempo wzrostu populacji ofiar
b = 1 # tempo, zjadania ofiar przez drapieżniki
c = 1 # tempo umierania drapieżników
d = 0.5 # tempo wzrostu populacji drapieżników

# Warunki początkowe
Wp = [4, 2] # Startowa populacja ofiar, drapieżników
# Czas symulacji
czas_sym = (0, 100)

# Zastosowanie solvera
sol = solve_ivp(
    model,
    czas_sym,
    Wp,
    args=(a, b, c, d)
)

x = sol.y[0]
y = sol.y[1]
t = sol.t

plt.plot(t, x, label='Ofiary')
plt.plot(t, y, label='Drapieżniki')

plt.xlabel('Czas (t)')
plt.ylabel('Populacja')
plt.legend()
plt.grid()
plt.show()