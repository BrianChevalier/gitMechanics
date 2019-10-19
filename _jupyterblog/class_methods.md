---
title: Class Methods
file_title: class_methods
---
## Defining a Point With Cartesian Coordinates

A point can be described by an $x$, $y$ coordinate pair (in 2D). In Python, a simple class can be created to manage a `Point`. The `__init__` class function, or "method" takes in a reference to the newly created object called `self` and the $x$ and $y$ coordinate. For printing a readable output the `__repr__` method is created which simply returns a `string` that represents the point.


```python
class Point:
    
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def __repr__(self):
        return f'({self.x}, {self.y})'
```

We can test this class by creating, or *instanciating* the class by calling it with an $x$, $y$ coordinate pair. This will simply print the point since we implemented the `__repr__` function.


```python
Point(1, 1)
```




    (1, 1)



## Defining a Point With Polar Coordinates

Points are sometimes best described in terms of *polar coordinates* instead of Cartesian coordinates. We could create an entirely new class that implements an `__init__` method that takes in a radius and angle but instead of creating an independent `Point` class, what we can do is create a "class method" that will translate the polar description to a Cartesian description and then create the `Point` object.

\begin{equation}
\mathbf{x} = \{x, y\} = \{R\cos(\theta), R\sin(\theta)\}
\end{equation}

A class method is defined just like all other methods, but the `@classmethod` decorator is added above the method creation, and the implicit argument is the reference to the class, `cls`, instead of a particular instance of the class, `self`. The method then returns a new `Point` by calling `cls`. This calls the original `__init__` method but with the polar coordinates translated to Cartesian coordinates.


```python
import numpy as np

class Point:
    
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    @classmethod
    def polar(cls, R, theta):
        x = R*np.cos(theta)
        y = R*np.sin(theta)
        return cls(x, y)
    
    def __repr__(self):
        return f'({self.x}, {self.y})'
```

Now instead of having users always make the translation within their own code, they can simply call the class method with the polar coodinates. This avoids repetition and helps create more maintainable code.


```python
Point.polar(1, 0)
```




    (1.0, 0.0)



In other languages this is known as an *alternative constructor*. In Python, there is no way to create multiple constructors and instead these class methods are used to translate input to create the object with the *default constructor*. This is a useful idea to use whenever there are multiple descriptions for the same object, in this case, polar vs. cartesian coordinates.
