#!/usr/bin/python3
import matplotlib.pyplot as plt
import numpy as np
import math as m

import sys
print(sys.version)

# Third order taylor polynomial for sin
fig, ax = plt.subplots()
ax.clear()
ax.grid(True, which='both',linestyle='dashed')
ax.set_xlabel('$x$')
ax.set_ylabel('$f(x)$')


x = np.linspace(-np.pi, np.pi, 200)

ax.plot(x, -1./6*x**3 + x, label='3rd order Taylor Polynomial',lw=2, linestyle='--',color='green')
ax.plot(x, np.sin(x), label='sin(x)',color='black',lw=3)
ax.legend()
fig.savefig("Figures/3ordersin.pdf", bbox_inches='tight')


## Multi taylor
fig, ax = plt.subplots()
ax.clear()
ax.grid(True, which='both', linestyle='dashed')
ax.set_xlabel('$x$')
ax.set_ylabel('$f(x)$')


x = np.linspace(-np.pi, np.pi, 200)

#5th
ax.plot(x, x**5/120. - 1./6.*x**3 + x, label='5th order',lw=2, linestyle='--')

#3rd
ax.plot(x, -1./6.*x**3 + x, label='3rd order',lw=2, linestyle='--')
#1st
ax.plot(x, x, label='1st order',lw=2, linestyle='--')

#True
ax.plot(x, np.sin(x), label='sin(x)',color='black',lw=3)
ax.legend()
fig.savefig("Figures/135ordersin.pdf", bbox_inches='tight')
