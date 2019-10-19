---
title: Numpy
file_title: Numpy
---
In this post we'll look at the difference between doing numerical computations with Python vs. MATLAB.

In MATLAB the basic data type is a matrix. This is fantastic if you're primarily working with matricies as this is the default type and operations between these data types are all assumed to be matrix operations. However, even in fields with matrix heavy operations, Python can be just as useful.

### Python Background
Since Python is a *general purpose* programming language, linear algebra data types and operations are not available in the basic set of python commands. Python does have a data type called a `list`. This list data type can contain many data types, including nested lists, within it and we can iterate through them[^1]. We will ignore the list data type here, and just look at using `numpy`, but just know that lists do *not* behave like matricies or arrays!

### Numerical Python
The basic linear algebra data type in Python is from the `numpy` library, and it provides the `array` data type. Arrays can be 0,1,2... dimensional arrays, where 2 dimensional arrays are actually matricies. 

First, let's import the Numerical Python (`numpy`) library under the namespace `np`.


```python
import numpy as np
```

Now, let's look at some basic array operations, and syntax.


```python
A = np.array([1, 2, 3])
B = np.array([4, 5, 6])
```


```python
print(A.shape, B.shape)
```

    (3,) (3,)


As you can see, `A` is a 1 dimensional array, with four elements, and `B` is a 1 dimensional array with 3 elements, as well.


```python
A + B
```




    array([5, 7, 9])



Because the arrays have the same shape, the arrays can be added together. They can also be multiplied. Note, the array multiplication is element-wise multiplication, that is, the elements in the corresponding places in the arrays are multiplied and a new array is created.


```python
A * B
```




    array([ 4, 10, 18])



As expected, division also occurs element-wise:


```python
A / B
```




    array([0.25, 0.4 , 0.5 ])



[^1]: You could even build up your own numerical computing library on top of the basic list data type. However, that would not only be a very inefficient use of your time, but would also yield a severely inefficient library for various reasons.
