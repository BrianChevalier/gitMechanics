---
title: Object Oriented Programming
file_title: OOP_Python
---
There are different programming paradigms. The kind you are likely familiar with is *procedural* programming. Python is capable, and even shines with procedural programming. However, Python has an *Object-oriented* programming paradigm that can help create maintainable and reusable code.

### What are objects?
Objects are way for you to define an abstraction of a data type that can be reused. Objects can be thought of as physical objects that contain a set of properties. Those properties can be adjusted through various functions that are applied to that object type (those are called methods). A *class* is the template that each object is based on. This is really abstract and doesn't make sense without some solid examples. So let's jump into an example.

### Structures as objects.
Let's look at defining some basic classes to help with structural analysis.

Below I have defined a basic `Node` class. A node is a place where a structural element (or memeber) begins and ends. In Python we use the keyword `class` to define a class name. The name of the class is `Node`, and it is based on the `object` class.

The other thing we need is to define the "constructor" method. This is just a function that is called when we make an object based on the `Node` class. To define a node we need an `x` and a `y` coordinate. The keyword `self` is a reference to the object that the `Node` class creates. We then say that the object takes `x` and defines it as an attribute of the object it*self*. The same occurs with `y`.


```python
class Node(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y
```

So what does that get us? Well now we can define `Node` objects in Python and extract back the data we entered. Below I will define two nodes called `n1` and `n2`.


```python
n1 = Node(0, 0)
n2 = Node(1, 0)
```

Let's try and get both of the nodal coordinates from the objects.


```python
print(n1.x, n1.y)
print(n2.x, n2.y)
```

    0 0
    1 0


This is great because the nodal coordinates are *encapsulated* within the namespace of the object. That is, we can easily reference the `x` and `y` coordinates of both nodes without having to define an array and remember indicies or define unique names for the attributes of the node object.

Well, now that we have two nodes, we might as well connect them! We will now define a `Member` class. This time instead of taking in a list of coordinate pairs, we will take a start node (SN) and end node (EN) to create the member.


```python
class Member(object):
    def __init__(self, SN, EN):
        self.SN = SN
        self.EN = EN
```

Now, we'll use the `Member` class to create a member that connects nodes 1 and 2.


```python
m1 = Member(n1, n2)
```

Let's echo the coordinates of the members start node and end node:


```python
print(f"({m1.SN.x},{m1.SN.y}) --> ({m1.EN.x},{m1.EN.y})")
```

    (0,0) --> (1,0)


As you can see, the object-oriented approach here provides a very natural way of grouping data that very nicely builds on the things that we have already defined. There are no namespace issues, and we're not accidentally overriding variables. But what else can this get us?

Let's take the `Member` class we defined and define a method, and wrap it in a `@property` decorator. A method is simply a function that operates on the objects own set of data. It can take in inputs, and must include the object itself. It then returns some output. By using the proprety decorator, we allow the length to be a dynamic property of the `Member` attributes. If we ever update a start node, then length automatically updates.


```python
import numpy as np
class Member(object):
    def __init__(self, SN, EN):
        self.SN = SN
        self.EN = EN
    
    @property
    def length(self):
        dx = self.EN.x - self.SN.x
        dy = self.EN.y - self.SN.y
        L = np.sqrt(dx**2 + dy**2)
        return L
```

Now let's define member 1 based on the updated `Member` class and take a look at the new attribute `length` we have access to.


```python
m1 = Member(n1, n2)
m1.length
```




    1.0



Now, whenever we need to use member 1 for any mathematical operations, we have access to its base attributes, but we also have access to its derived attributes, which can be really convenient for building up more complex programs.

### Conclusion
This has been a pretty quick look at what object-oriented programming can do for structural analysis. This particular use is what convinced me to learn it and help me understand why it is important. The classes I have defined here are relatively simple, but they can easily scale. For instance, each node could have an associated nodal cost. Each member could have its own cross section (and each cross section type have their own attributes and derived attributes), and element stiffness. These could all be then built into a `Structure` class.
