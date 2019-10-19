import matplotlib.pyplot as plt
import numpy as np
import math as m


# Third order taylor polynomial for sin
f = plt.figure()
plt.grid(True, which='both',linestyle='dashed')
plt.xlabel('x')
plt.ylabel('f(x)')
x = np.linspace(-np.pi, np.pi, 500)

plt.plot(x, -1/6*x**3 + x, label='3rd order Taylor Polynomial',lw=2, linestyle='--',color='green')

plt.plot(x, np.sin(x), label='sin(x)',color='black',lw=3)

plt.legend()
f.savefig("Figures/3ordersin.pdf", bbox_inches='tight')

## Multi taylor
f = plt.figure()
plt.grid(True, which='both', linestyle='dashed')
plt.xlabel('x')
plt.ylabel('f(x)')
x = np.linspace(-np.pi, np.pi, 500)

#5th
plt.plot(x, x**5/120 - 1/6*x**3 + x, label='5th order',lw=2, linestyle='--')

#3rd
plt.plot(x, -1/6*x**3 + x, label='3rd order',lw=2, linestyle='--')
#1st
plt.plot(x, x, label='1st order',lw=2, linestyle='--')

#True
plt.plot(x, np.sin(x), label='sin(x)',color='black',lw=3)

plt.legend()
f.savefig("Figures/135ordersin.pdf", bbox_inches='tight')
