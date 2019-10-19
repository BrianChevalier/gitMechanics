---
title: "Python Basics"
file_title: Python_Basics
---
In this post we'll look at some of the basics of Python. This isn't an exhaustive look, but does cover many of the fundamentals.

## Printing
Below are the two most basic print statements. Notice that the name of the function is `print` and that it takes a `string` as input. Also, at the end of the `print` statement, a newline is automatically added, no need to manually insert a newline.


```python
print('Hello')
print('World!')
```

    Hello
    World!


Using Python 3.6+ `fstrings` is the best way to print strings intermixed with variables. It provides a very easy syntax for including varibles. Simply add the key letter `f` before the start of your string to `print` and inside the string you can use `{}` to reference variables.


```python
var1 = 'Hello'
var2 = 'World!'
print(f'{var1} and {var2}')
```

    Hello and World!



```python
var1 = '1 divided by 3 is'
var2 = 1/3
print(f'{var1}: {var2}')
```

    1 divided by 3 is: 0.3333333333333333


We can choose the precision printed by specifying the number of digits after the decimal using `{var2:.4}`, where `4` is the number of digits after the decimal.


```python
print(f'{var1}: {var2:.4}')
```

    1 divided by 3 is: 0.3333


[Here](https://realpython.com/python-f-strings/) is some more documentation on using Python `fstrings`. The first parts look over previous printing methods and finally goes over why `fstrings` are the best.

## Lists

A Python `list` is a collection of Python objects that are stored together and can be retrieved. They can be any type.


```python
items = [1, 2, 'purple', True]
items
```




    [1, 2, 'purple', True]



We can retrieve individual values from the defined list using the following syntax:


```python
items[0]
```




    1



Note that Python is a language that is **zero-indexed** meaning that the first item in a list is zero-th element[^1]. We can get the first two items using the following:


```python
items[0:2]
```




    [1, 2]



Let's take a list of numbers and try to double the entries:


```python
items2 = [1, 1]
2 * items2
```




    [1, 1, 1, 1]



Python lists, since they can store any data type do not follow the rules you may be familiar with in other languages. Multiplying a list by an integer makes a list longer, because it appends that number of links together. Note that you can only multiply by integers because you can't add 2.5 lists together, for instance. If you're looking to use Python for linear algebra applications, you'll want to use the `Numpy` library.

## Functions
In Python, functions can be defined anywhere. They are defined by the keyword `def` followed by the name of the function, in this case `func`, and in parenthses, it defines the input argument `x`, followed by a `:`. The function returns whatever is after the `return` keyword. Note that the code in the function is *indented*. Indentation is how Python determines what is a part of the function.


```python
def func(x):
    return x**2

print(f'2 squared is: {func(2)}')
```

    2 squared is: 4


Functions can take multiple arguments as input. Note that the order of variables when you use the functions matters!


```python
def quadratic(x, a, b, c):
    return a*x**2 + b*x + c

print(f'The value is: {quadratic(1, 2, 3, 4)}')
```

    The value is: 9


### Keyword arguments
Python functions can also take 'keyword' arguments. These arguments are passed by variable name, instead of by position. Keyword arguments must have defined defaults in case they are not assigned. The following function will print the variable `keyword`, if it is not passed as a keyword argument, then it will default to `keyword=1`. Positional arguments can be combined with keyword arguments, the only restriction is that positional arguments must be defined before the keyword arguments when defining the function.


```python
def funKey(positionalArgument, keywordArgument=10):
    print(f'positionalArgument: {positionalArgument}, keywordArgument: {keywordArgument}')

funKey(1)
funKey(2,keywordArgument=20)
funKey(3,keywordArgument=30)

```

    positionalArgument: 1, keywordArgument: 10
    positionalArgument: 2, keywordArgument: 20
    positionalArgument: 3, keywordArgument: 30


### Loops
For loops allow dynamically iterating through items in a list, very elegantly. In Python, the syntax is shown below. The keyword `for` indicates that it is a loop. `item` is the variable that changes on each iteration of the loop, where they are assigned from the items in the list `items`. The line must end with a `:`, and items in the `for` loop must be **indented**, just like functions.


```python
for item in items:
    print(item)
```

    1
    2
    purple
    True


Python allows for accessing both the current item in the list as well as the current index. There's no need to define a counter and manually increase! This is accomplished by using the `enumerate` function, with the list as an input, and assigning `index` and `item`.


```python
for index, item in enumerate(items):
    print(f'{index} : {item}')
```

    0 : 1
    1 : 2
    2 : purple
    3 : True


Using the `range` function allows iterating through a range of numbers. Essentially, `range` produces a list of values, and for each iteration of the `for` loop, the value `i` is assigned each successive value. Note that the range function is inclusive on the lower bound and non-inclusive on the upper bound. In math notation `[0,10)`.


```python
for i in range(0, 10):
    print(i)
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9


### Conditionals & Boolean Operators
Python `if` statements allow for defining different scenarios based on values and boolean operations. In the example below, we compare the values `a` and `b`. We test if a is greater than b, if a is less than b, and add a condition for all other cases (which would simply be the values being equal). We print the values of the variables and how the variables are related.


```python
a = 1
b = 2

if a > b:
    print(f'{a} > {b}')
elif a < b:
    print(f'{a} < {b}')
else:
    print(f'{a} = {b}')
```

    1 < 2


### Dictionaries
Dictionaries are a Python data type similar to `JSON`. They are like lists but instead of numerical indicies, the indicies are strings. They are also refered to as `key` `value` pairs, where each key is associated with each value. This means that we can retrieve information with no need to know the order of the items in the dictionary. Let's define a dictionary below.


```python
# Braces enclose the dictionary
dict = {'key1': 'val1',  # the : seperates the keys and values
        'key2': 'val2',   # there is a comma between the key/val pairs
        'key3': 3,
        'key3': [1, 2, 3, 'string']
       }
```

Let's retrieve the first `key` of the dictionary called `dict`.


```python
dict['key1']
```




    'val1'



We can redefine keys in a dictionary, or add new `key` `value` pairs like the following:


```python
dict['key1'] = 'newval1'
dict['key4'] = 'val4'
```

Let's look at two ways of iterating through the dictionary and printing the `key` `value` pairs. This first way, we will set the variable `key` to each `key` in the dictionary called `dict`. Then inside the `for` loop, we print out the value of `key` and the value associated with that key by printing `dict[key]`.


```python
for key in dict:
    print(f'{key} : {dict[key]}')
```

    key1 : newval1
    key2 : val2
    key3 : [1, 2, 3, 'string']
    key4 : val4


A slightly clearer way of doing the same thing is to set the value of *both* `key` and `value` from the dict. We can set both by calling the `items` method on the dicitonary `object`. Then in the print statement, we can directly print each `key` and `value` without manually retieving the value inside the for loop. This makes the code look much clearer.


```python
for key, value in dict.items():
    print(f'{key} : {value}')
```

    key1 : newval1
    key2 : val2
    key3 : [1, 2, 3, 'string']
    key4 : val4


### Importing Modules
Python is an incredibly *extensible* language. Python also ships with many packages. You can access these packages by using the `import` statement. For instance we can import thr Numerical Python library by the following:


```python
import numpy
```

Then the functionality of that package bcomes available under the name `numpy`. For instance we can take the sine of $\pi$


```python
numpy.sin(numpy.pi)
```




    1.2246467991473532e-16



Writing out the full package name each time can be cumbersome so you can create an alias with the `as` keyword.


```python
import numpy as np
np.sin(np.pi)
```




    1.2246467991473532e-16



The functions can also be imported into the *global* namespace with no need to prefix with the namespace, like the following:


```python
from numpy import sin, pi
sin(pi)
```




    1.2246467991473532e-16



However, this should be used sparingly. The namespace should be used to explicitly show where each function is being imported from. This is important particularly because there can be name clashes that create unexpec. There is another module called math that also has `sin` and `pi` defined.


```python
import math
math.sin(math.pi)
```




    1.2246467991473532e-16



In this case they produce the same result. However, this may not always be the case. Explicit is always better than implicit. While this syntax may look hideous if you aren't comfortbale with the idea of namespaces, it is one of the features that allow Python to be extensible and what makes writing your own packages incredibly easy!

---
[^1]: There are pros and cons to zero indexing and one indexing that we're not going to get into. If you'd like to read more about the benefits read [this](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html).
