---
title: Printing
---
Printing can be confusing with GNU Octave/MATLAB. In this post we'll take a look at how to print using the `fprintf` command.

### What is `fprintf`
`fprintf` is a command to print formatted text to the command window, using a 'formmating string' (also known as a format specification) provided by the programmer. This allows full control over how data will be printed, but requires some understanding on how to write a formatting string.

### Data Types
There are a few critical data types you need to know about to understand how to print. The following table will define the types we will need to be familiar with. This is important in order to print we have to format the data that we have.


| Type   | Meaning                | Example       | Format Letter |
|---     |---                     |---            |---            |
| Ineger | Whole Number           | 53            | `i`           |
| Float  | Number with a decimal  | 3.14          | `f`           |
| String | Text surrounded by `'` | 'Hello World!'| `s`           |

### Control Characters

The following characters are characters that produce some special format. For instance the `\n` special character adds a newline. This is important to have because there is no way to add a newline within the format specification of a printing command directly.

| Special Character | Control Character   |
|---                |---                  |
| Newline           | `\n`                |
| Tab               | `\t`                |

There are more but they are outside of the scope of this post. Check [here](https://www.mathworks.com/help/matlab/ref/fprintf.html#btf8xsy-1_sep_shared-formatSpec) for a complete list of formatting operators.

#### Example 1
In the next example we will print out an integer followed by a newline. The format specification is the first string argument in the `fprintf` command below. The `%` means that the following characters are going to be replaced by a variable, and can provide some information on how that variable should be printed. So `%i` means that the first variable after the format specification will be an integer. It is followed by a newline special character.


```octave
integer = 1;
fprintf('%i\n', integer)
```

    1


#### Example 2
In the next example, we'll print a predefined string using a similar format:


```octave
string1 = 'This is a string!';
fprintf('%s\n', string1)
```

    This is a string!


#### Example 3
Let's print a floating point number with a specified precision. We'll print the same floating point number three times, once with one decimal place, once with two decimal place, and once with three. The way that we acccomplish this is by specifying the number of digits before and after a decimal point. This is explained in the following table:

| %  | 1  |  . | 1  | f  |
| -- | -- | -- |--- | --- |
|Special Character | 1 digit before the decimal| decimal | 1 digit after the decimal| Floating point number|


```octave
myFloat = 1/3;
fprintf('%1.1f\n', myFloat)
fprintf('%1.2f\n', myFloat)
fprintf('%1.3f\n', myFloat)
```

    0.3
    0.33
    0.333


#### Example 4
Now, lets print a string and a floating point number. The format specification is defined by the variable `formatSpec`. The meaning of this is described below:

| `%s` | `%3.3f` | `\n`|
| --- | --- | --- |
| String| Float, 3 digits before the decimal, 3 after| Newline|



```octave
formatSpec = '%s%3.3f\n';
myString = 'The answer is: ';
myFloatingPointNumber = 100 + 1/3;
fprintf(formatSpec, myString, myFloatingPointNumber)
```

    The answer is: 100.333

