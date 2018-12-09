import matplotlib.pyplot as plt
import numpy as np
import math as m


# Third order taylor polynomial for sin
f = plt.figure()
plt.grid(True, which='both',linestyle='dashed')
plt.xlabel('x')
plt.ylabel('f(x)')
x = np.linspace(-np.pi, np.pi, 500)

plt.plot(x, -1/6*x**3 + x, label='Taylor Polynomial')

plt.plot(x, np.sin(x), label='sin(x)')

plt.legend()

f.savefig("Figures/3ordersin.pdf", bbox_inches='tight')
