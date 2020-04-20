---
title: Sympy
file_title: Sympy
---
`SymPy` is a symbolic mathematics library built on the Python programming language.

In this post we'll look at how to use some of the basic functions of the library.


```python
import sympy as sy
```

The equation that we want to solve is in the form of
\begin{equation}
a x^2 + bx + c = 0
\end{equation}

### Solving Algebraic Roots
Let's solve for the roots of the quadratic equation. First we have to define the relevant variables as sympy symbols. We can accomplish this in one line by using the `symbols` function, providing a list of variables, and setting them to the associated variables that we want to use. The order does matter [^1].


```python
a, b, c, x = sy.symbols('a, b, c, x')
```

Next, let's define the quadratic equation as a `sympy` equation using the `Eq` function. Note that the equation is assumed to be equal to zero.


```python
eq = sy.Eq(a*x**2 + b*x + c)
```

    /home/travis/build/BrianChevalier/gitMechanics/.snakemake/conda/ee189a0b/lib/python3.6/site-packages/sympy/core/relational.py:470: SymPyDeprecationWarning: 
    
    Eq(expr) with rhs default to 0 has been deprecated since SymPy 1.5.
    Use Eq(expr, 0) instead. See
    https://github.com/sympy/sympy/issues/16587 for more info.
    
      deprecated_since_version="1.5"


Let's make sure that our equation looks right by printing it:


```python
print(eq)
```

    Eq(a*x**2 + b*x + c, 0)


This is pretty ugly. Luckily, we can print a much better version using tools built into `sympy`.


```python
sy.init_printing(use_latex='mathjax')
eq
```




$\displaystyle a x^{2} + b x + c = 0$



We can even print out the $\LaTeX{}$ used to display the equation we can be copied and pated into $\LaTeX{}$ documents.


```python
sy.print_latex(eq)
```

    a x^{2} + b x + c = 0


Now, let's go ahead and solve the equation for $x$. All we need to do is call the `sympy.solve` function with the equation and the variable we want to find.


```python
solutions = sy.solve(eq, x)
solutions
```




$\displaystyle \left[ \frac{- b + \sqrt{- 4 a c + b^{2}}}{2 a}, \  - \frac{b + \sqrt{- 4 a c + b^{2}}}{2 a}\right]$



The function returned a list of solutions. The quadratic equation has two roots (which should come as no suprise). Using typical python syntax we can extract the first solution:


```python
solutions[0]
```




$\displaystyle \frac{- b + \sqrt{- 4 a c + b^{2}}}{2 a}$



We can even substitute in values for the constant coefficients using the `subs` method on the first solution:


```python
solutions[0].subs({a:1,b:2,c:-1})
```




$\displaystyle -1 + \sqrt{2}$



### Conclusion
`SymPy` is a great stand-alone symbolic computing library. It has many features, and its integrations with Jupyter notebooks makes it great for interactive computational mathematics. Because Python is a free, open source langauge it can be extended for uses such as symbolic computations and retain the rich programming features that are built into the core of the language.

[^1]: NOTE: The list on the right side of the assignment does not have to match the left. I could have assigned `a` to be equal to the variable `x`, but this would be very confusing and bad practice. Don't do that!
