### Basic Object Methods

| Called | Method |
| :-- | :-- |
| `obj = Object()` | `__init__(self[, ...])` |
| `str()` | `__str__(self)` |
|`repr()`| `__repr__(self)`|


```python
class Object:
    
    def __init__(self, x):
        self.x = x
    
    def __str__(self):
        return f'{self.x}'
    
obj = Object(1)
print(obj)
```

    1


### Emulating Callable Types

| Called | Method |
| :-- | :-- |
|on object call `obj()`| `__call__(self [,args...])`|

### Emulating Numeric Types
| Called | Method |
| :-- | :-- |
|`+`| `__add__(self, other)`|
|`-`| `__sub__(self, other)`|
|`*`| `__mul__(self, other)`|
|`@`| `__matmul__(self, other)`|
|`/`| `__truediv__(self, other)`|
|`//`| `__floordiv__(self, other)`|
|`%`| `__mod__(self, other)`|
|`**`| `__pow__(self, other[, modulo])`|
|`<<`| `__lshift__(self, other)`|
|`>>`| `__rshift__(self, other)`|

### Extended Assignments

| Called | Method |
| :-- | :-- |
|`+=`| `__iadd__(self, other)`|
|`-=`| `__isub__(self, other)`|
|`*=`| `__imul__(self, other)`|
|`@=`| `__imatmul__(self, other)`|
|`/=`| `__itruediv__(self, other)`|
|`//=`| `__ifloordiv__(self, other)`|
|`%=`| `__imod__(self, other)`|
|`**=`| `__ipow__(self, other[, modulo])`|
|`<<=`| `__ilshift__(self, other)`|
|`>>=`| `__irshift__(self, other)`|

### Comparison Operators

| Called | Method |
| :-- | :-- |
|`<`| `__lt__(self, other)`|
|`<=`| `__le__(self, other)`|
|`==`| `__eq__(self, other)`|
|`!=`| `__ne__(self, other)`|
|`>`| `__ge__(self, other)`|
|`>=`| `__gt__(self, other)`|

### Context Managers

| Called | Method |
| :-- | :-- |
| on enter | `__enter__(self)` |
| on exit | `__exit__(self, exc_type, exc_value, traceback)` |


```python
class ManagedObject:
    
    def __enter__(self):
        print('enter')
    
    def __exit__(self, exc_type, exc_value, traceback):
        print('exit')

with ManagedObject():
    pass
```

    enter
    exit


[1]: https://docs.python.org/3/reference/datamodel.html


```python

```
