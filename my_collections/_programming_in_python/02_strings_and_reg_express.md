---
title: "Strings and regular expressions"
excerpt: "Become a master of working with strings"
toc: true
toc_sticky: true
---
<script src="https://unpkg.com/vanilla-back-to-top@7.2.1/dist/vanilla-back-to-top.min.js"></script>

<script>addBackToTop()</script>

---

In this module we will talk about strings and introduce regular expressions. But firstly, in section three, we have to introduce the commonly used nomenclature, without which it would be hard to talk about particular things. Part of these words was used by us without an explanation of what they really mean. Let's complement our knowledge.

---

---



# 1. Scripts

<a href="https://github.com/lazarskiopencourses/lazarskiopencourses.github.io/tree/master/courses/programming_in_python/02_strings_and_reg_express/scripts/">Strings and regular expressions scripts</a>

---

# 2. Videos

<iframe width="560" height="315" src="https://www.youtube.com/embed/?playlist=,C_Y3bi19Sh8,N8sL98yHLW0,tsTqTvNfE6Q,EAp83Ua6olY,8hSVmAWjf94,EtdsquQSEs4,oyQ2ZCISAWM,JIUj2ERdvSU,cvdsw-KEzwQ,JdEXT9Pnc5w,C_qR3O8vGgw,fhltJtAn0BQ,UyAs711539s,MTly6c_tkfQ,o2mU9csk_MM," title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Make sure that you have watched all the videos from this playlist!

- Introduction,
- Defining recap,
- Operations recap,
- Input function,
- f-Strings,
- Accessing characters,
- For loop,
- Slicing,
- Modifying,
- Looping once again,
- Logical operations,
- Comparisons,
- Built-in functions,
- Regular expressions,
- re pattern matching.

---

---


# 3. Important nomenclature

## 3.1. Method

A method is a function assigned to a specific object. For instance, having a string `'doomscrolling'`, we can use a variety of functions, such as `upper(), replace(), capitalize(), lower(), count()` with a typical to methods, `. (dot)` syntax. Like that:

```
>>> 'doomscrolling'.capitalize()
'Doomscrolling'
```

---

### 3.1.1. dir function

The **dir** helps us with checking what methods are defined and can be used with a particular object. Its argument should be an instance of an object or keyword assigned to a specific type. For example, after executing `dir(str)` we should see:

```
['__add__', '__class__', '__contains__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__getnewargs__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mod__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__rmod__', '__rmul__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'capitalize', 'casefold', 'center', 'count', 'encode', 'endswith', 'expandtabs', 'find', 'format', 'format_map', 'index', 'isalnum', 'isalpha', 'isascii', 'isdecimal', 'isdigit', 'isidentifier', 'islower', 'isnumeric', 'isprintable', 'isspace', 'istitle', 'isupper', 'join', 'ljust', 'lower', 'lstrip', 'maketrans', 'partition', 'removeprefix', 'removesuffix', 'replace', 'rfind', 'rindex', 'rjust', 'rpartition', 'rsplit', 'rstrip', 'split', 'splitlines', 
'startswith', 'strip', 'swapcase', 'title', 'translate', 'upper', 'zfill']
```

Methods which contain underscores in their names are more technical, and we will not use them directly. Within the rest, we can see that all the previously mentioned methods: `upper(), replace(), capitalize(), lower(), count()` are listed and many others about which we will learn during this module.

---

## 3.2. Object

An object is a collection of data and methods that act on this data. This is very crucial to understand because Python is an object-oriented programming language. All objects in Python are characterized by identity, type, and value. There exists even a common phrase that everything in Python is an object. Let's briefly discuss these terms.

---

## 3.3. Identity

The object’s identity **never changes once it has been created**; this is something like a national ID number. You can change your name, surname or ask your friends to use another nickname for you. But usually, you cannot change your national ID number. This is the number your country uses to refer to specifically you. The identity of an object in Python plays a similar role. This is the **object’s address in memory**. Python uses the identity to determine where the object itself can be found. It doesn't matter what are the current names for the object, i.e. what variables point to this object.

The `is` **operator** compares if the identity of two objects is the same:

    >>> a = [1, 2, 3]
    >>> b = a
    >>> a is b
    True

If you want to see what is an identity of an object, you can do so with the `id` function - note that you will most likely get a different output on your computer:

    >>> id(a)
    4449813056
    >>> id(b)
    4449813056

Python shows us the id of the _object_ stored in the variable. We can clearly see that the id of the object stored in `a` is the same as the id of the object stored in `b`.

---

## 3.4. Type

The object’s type defines the **possible operations** we can perform on the object. For instance, we can ask Python to compute the length of this object using the `len` function on it.  As we will learn at some point, the type of an object also determines what values and methods can be found as features of this object. We will dive into that when we will be discussing objects and classes, but you kind of already have seen that. For instance, if we are dealing with a `str` we will find a method `capitalize` in this type. There is no such method for a `list`:

    >>> "mateusz".capitalize()
    'Mateusz'
    >>> [1, 2, 3].capitalize()
    Traceback (most recent call last):
      File "`<stdin>`", line 1, in `<module>`
    AttributeError: 'list' object has no attribute 'capitalize'

The `type` function which you already know returns the type of an object. The object's type is **unchangeable** like the object's identity.

---

## 3.5. Value

The value of the object is the data stored inside. For a `[1, 2, 3]` list it's the sequence of numbers stored in this specific order. The `'mateusz'` string it's the sequence of letters.

The value of some objects can change. Objects **whose value can change are called mutable**. Objects **whose value is unchangeable** after they were created are called **immutable**. Hence, the type of an object _determines its mutability_.

You may find more information at [link](https://towardsdatascience.com/https-towardsdatascience-com-python-basics-mutable-vs-immutable-objects-829a0cb1530a). Quotes were also made from this reference.

---

## 3.6. `help` function

For more information about each type, you may simply call a `help` function. Inside the parentheses, you should provide the name of the data type about which you want to learn more.

    >>> help(int)
You should see something like this:

    Help on class int in module builtins:

    class int(object)
     |  int([x]) -> integer
     |  int(x, base=10) -> integer
     |
     |  Convert a number or string to an integer, or return 0 if no arguments
     |  are given.  If x is a number, return x.__int__().  For floating point
     |  numbers, this truncates towards zero.
     |
     |  If x is not a number or if base is given, then x must be a string,
     |  bytes, or bytearray instance representing an integer literal in the
     |  given base.  The literal can be preceded by '+' or '-' and be surrounded
     |  by whitespace.  The base defaults to 10. Valid bases are 0 and 2-36.
     |  Base 0 means to interpret the base from the string as an integer literal.
     |  >>> int('0b100', base=0)
     |  4
     |
     |  Built-in subclasses:
     |      bool
     |
     |  Methods defined here:
     |

| __abs__(self, /) |
| :--------------------: |

To scroll through the help page in the inline mode you usually press `enter`. To quit you usually have to press `q`.

---

---

# 4. Strings

Quick remainder: `string` is a sequence of characters. These characters are stored in a computer memory as bytes that represent unicode characters. In Python, there is no character data type, so even a single character is a string of length 1.

---

## 4.1. Defining a string

Defining a string is a very simple operation that might be done in multiple ways. The simplest ones are as follows:

- single quotation marks.

  A = 'String between single quotation marks'
- double quotation marks

  B = "String between single quotation marks"
- triple times double quotation marks

  C = """String between single qu
  quotation marks"""
- `str()` function

  D = str(21.37)

When you execute the following 4 lines of code, the `A, B, C, D` variables will be set. As you might expect `A == B == C` - all 3 create the same string. Check it by yourself!

---

## 4.2. EX. 1 - no points, no grader

Try to figure out how to include a single or double quotation mark within your string. Try to create a variable with the following string stored inside: `Whenever you look back and say "if" you know you're in trouble. There is no such thing as "if". The only thing that matters is what really happened` (by D.J. MacHale, The Merchant of Death ). Sample answer at the end of this file.

---

## 4.3. Special characters

It is worth highlighting that `" ' " =! ' " '`, despite the fact that both quotation marks serve us for creating a string. When they are treated as part of the string, they are completely different characters!

In Python the backslash `\` is an escape character. When you use `\` in fornt of another character, the meaning of that character is changed. There are atleast a few special characters that you should know:

| Special character |     how it works     |                  example                  |
| :---------------- | :------------------: | :----------------------------------------: |
| `\t`            |       is a tab       |     `My dog likes to eat \t  a lot!`     |
| `\n`            |     is a newline     | `\n she is the fastest dog in the world` |
| `\r`            | is a carriage return | `she also likes \r to swim\\dive a lot` |
| `\\`            |    is a backslash    | `she also likes \r to swim\\dive a lot` |

Now try to combine all examples into one variable and print it out. The [carriage return](https://en.wikipedia.org/wiki/Carriage_return) is probably a hard one. Try to read more about this on Google.

---

---

# 5. Basic String Operations

In Python one may perform kind of mathematical operations on strings. You can easily add strings or multiply a string by a `int`.

---

## 5.1. Concatenation

Concatenating strings means merging them together, which means we need at least 2 strings in order to perform concatenation. This can be performed by using `+` sign. Let us do it now:

```python
name = 'James'
surname = 'Bond'
full_name = name + surname
print(full_name)
```

When you run such an example, the output is obvious.

    JamesBond

---

## 5.2. String multiplication

**input(...)**

`input()` is a built-in python function which reads a line from input(input with the help of keyboard), converts it to a **string**, and returns that. A great example of usage of such a function is whenever you provide the PIN code while withdrawing money from an ATM or unlocking your smartphone.

```python
pin = 1234
user_pin = input("Please input your 4 digit PIN number: ")#Ask user to provide a PIN code
user_pin = int(user_pin) # Convert PIN in string type into integer
if pin == user_pin:
    print("Acces approved")
else: print("Access denied")
```

---

In this method instead of concatenating strings together, you may multiply a string. You need a string and an `int` to do so.

```python
text = input('Please, provide a text ')
number = int(input('Please, provide a multiplicator(integer) '))
multip_string = text * number
print(multip_string)
```

OR

```
text = 'Hi! '
number = 10
multip_string = text * number
print(multip_string)
```

Which after execution will show to you:

    Hi! Hi! Hi! Hi! Hi! Hi! Hi! Hi! Hi! Hi!

---

---

# 6. Print() upper-level

Up to this point, you should be familiar with the Python built-in function `print()`. Now you will learn how to use it more effectively, especially when you have to deal with many variables and there is a lot to print on screen. `.format()` is another build-in Python function which is a great aid for `print()`. Using this function/method allows you to combine strings with other type objects. Let us try to print the information provided below in one `print()`.

```python
rates = " Interest Rate for months of 2022 in %"
Jan = 2.25
Feb = 2.75
Mar = 3.5
Apr = 4.5
May = 5.25
Jun = 6
Jul = 6.5
```

- Method 1

```python
print(rates, "\nJan: {}".format(Jan), "\nFeb: {}".format(Feb), "\nMar: {}".format(Mar), "\nApr: {}".format(Apr),
            "\nMay: {}".format(May), "\nJun: {}".format(Jun), "\nJul: {}".format(Jul))
```

- Method 2

```python
print(rates + '\n' + "Jan: {}\nFeb: {}\nMar: {}\nApr: {}\nMay: {}\nJun: {}\nJul: {}".format(Jan, Feb, Mar, Apr, May, Jun, Jul))
```

- Method 3

```python
print(rates, "Jan: {}\nFeb: {}\nMar: {}\nApr: {}\nMay: {}\nJun: {}\nJul: {}".format(Jan, Feb, Mar, Apr, May, Jun, Jul), sep ='\n')
```

Try to run all of these 3 examples and compare the results. As you may see in each method `{}` is the crucial point of your print statements. When the line of code is executed the `{}` are replaced by the value of interest rate provided inside `.format()`. The order of months inside the `.format()` is not accidental, variables should be provided in the desired order of printing.

We can also print the following example with a `f-string` method. Using this method helps to improve the clarity of the code.

```python
print(rates, f"Jan: {Jan}", f"Feb: {Feb}", f"Mar: {Mar}" ,f"Apr: {Apr}:", f"May: {May}", f"Jun: {Jun}", f"Jul: {Jul}", sep ='\n')
```

In this method, you have to use `f` to indicate that you want to use a `f-string` method, and then you have to provide a variable name to print in `{}`.

Another possible method to use in `print()` function is a `%` method. This allows to substitute:  `%d` by a integer, `%g` by a float and `%s` by a string. Following this, our example may be rewrite as:

```python
print(rates + '\n' + "Jan: %g\nFeb: %g\nMar: %g\nApr: %g\nMay: %g\nJun: %g\nJul: %g" % (Jan, Feb, Mar, Apr, May, Jun, Jul)) 
```

OK, now it is time for practice!

---

## 6.1. EX. 2 - no points, no grader

Create a variable `information_about_patron` that contains all basic information about [Ignacy Lukasiewicz](https://en.wikipedia.org/wiki/Ignacy_%C5%81ukasiewicz) the patron of 2022 year in Poland. Pleas provide the following: name, surname, place of birth, age, occupation(all). With the aid of explained `print()` methods try to recreate the following output layout.

```python
name = ...
surname = ...
place_of_birth = ...
age = ...
occupation = ...
```

Sample answer at the end of this file.

---

---

# 7. How to Index and Slice Strings

---

## 7.1. Index

You should already know that a string is a chain of characters. So all characters which are inside a string have their position in the chain and so might be called by position number:

```python
movie = 'Interstellar'
letter = movie[1]
```

In the above code, we assign `'Interstellar'` to variable `movie`. Then a character with position number 1 is assigned to the variable `letter`. If we check what is stored in the variable `letter`, we will see a letter `n`. This is because `<ins>`in Python indices start form 0 `</ins>`:

    print(letter)

and the output is:

    'n'

Check out the following table to see all indices for the `'Interstellar'` example:

| Indexes    | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 |
| ---------- | - | - | - | - | - | - | - | - | - | - | -- | -- |
| characters | I | n | t | e | r | s | t | e | l | l | a  | r  |

---

## 7.2. Slicing

Python allows one to slice a string into pieces quite easily. To do it you just have to use a `[]`, `:` and digits. You might recognise that it works exactly the same as with lists. Let us have a look at some examples with a quote from Steve Jobs:

```python
quote = "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma — which is living with the results of other people's thinking. -Steve Jobs"
quote_a = quote[2:22]
quote_b = quote[22:]
quote_c = quote[:4]
quote_d = quote[1:100:10]
quote_e = quote[::10]
quote_f = quote[::-5]
```

First we have defined our `quote`. Then various slices of this quote were created and stored in variables. These examples show the majority of ways to do slicing. Print respective variables to see what happens in each case.

    >> print(quote_a)
    ur time is limited,

`quote_a` is a slice that contains all characters from 2 to 21. The 22 is not included. This pattern works like this: `[first index to include : first index which will not be included]`.

    >> print(quote_b)
    so don't waste it living someone else's life. Don't be trapped by dogma — which is living with the results of other people's thinking. -Steve Jobs

In `quote_b` all characters from 22nd to the end of the string are included. This pattern works like this: `[first index to include : (no digits means go to the end of the string)]`.

    >> print(quote_c)
    Your

`quote_c` is something opposite to `quote_b`. Start from the beginning of a string and slice until the provided character index. This pattern works like this: `[(no digits means start form index 0) : first index which will not be included]`.

    >> print(quote_d)
    os wio 'pm

`quote_d` is more tricky than the previous one. Here, we provide `start : stop : step`. Slice starts form 1st idex, ends with 100th index, but contains characters of indices 1, 11, 21, 31, 41, 51, 61, 71, 81, and 91. Every 10th index is included. This is how the step value works. This pattern works like this: `[first index to include : first index which will not be included : step]`.

    >> print(quote_e)
    Yi, lesnpghg fone

`quote_e` has only a `step` value provided. This takes into consideration the whole string, but only each 10th index is stored in the result. If instead of 10, we provide `-1` all characters from the string in reverse order will be assigned/printed. This pattern works like this: `[(no digits means start form index 0) : (no digits means end with the last index) : step]`.

    >> print(quote_f)
    se-itl osetwviha ett lsnsvianst mu

`quote_f` is another example of the pattern used in `quote_e`. The only difference is that we use negative step and so Python starts at the end of a string and stores every 5th element. The first `s` in the output comes from `Jobes`.

---

## 7.3. Can you modify strings?

Worth noting is a fact that one cannot assign a new character to an existing string.

    quote[0] = 'M'

If you execute such a line, you will see:

```python
TypeError: 'str' object does not support item assignment
```

So, if you want to have some a string which contains different characters than the ones you already have, the only thing you can do is to create a new string. For instance, you can take slices of an existing string and concatenate it with new characters:

    >> new_quote = 'M' + quote[1::]
    >> new_quote
    Mour time is limited, so don't waste it living someone else's life. Don't be trapped by dogma — which is living with the results of other people's thinking. -Steve Jobs

or:

    >> new_quote = quote[:3] + 'ssa' + quote[4:]
    >> new_quote
    Youssa time is limited, so don't waste it living someone else's life. Don't be trapped by dogma — which is living with the results of other people's thinking. -Steve Jobs

---

---

# 8. Looping Over a String

As you know, a string is a chain of characters. Each character has an index number. Thanks to this we can loop over characters in string. You can easily use a `for` or a `while` loop:

```python
    my_string = 'AaBbCcDdEeFf'
    for character in my_string:
        print(character)
```

or:

```python
    my_string = 'AaBbCcDdEeFf'
    index = 0
    while index < len(my_string):
        print(my_string[index])
        index += 1
```

After running these lines of code, you will see each letter of `my_string` on your screen.

---

---

# 9. Logical Operations on Strings

Beside finding the length of a string or rewriting it in reverse order, you may want to check whether a given string satisfies some condition. E.g. find if a given character is a part of your string. We can do this with the aid of logical operations. For example (remember that `==` stands for `<ins>` is equal to`</ins>`):

```python
def letter_check(string, character):
    present = False
    for letter in string:
        if letter == character:
            present = True
            break
    return present
```

The `letter_check` function creates a helper variable `present` which stores our current believes about the whether a letter is present in a string or not. Before we start going through the string, we have to safely assume that the letter is not present in it. Then we go through all the letters. If at some point we find a letter which is 'equal to' the provided `character` we change our beliefs (`present = True`) and stop the loop (`break`). After 2 letters match, the function breaks. So, after we run it for `print(letter_check('word', 'o'))` the output is `True`.

Luckily, we can solve the same problem much more easily in Python. The reserved keyword `in`, which you already know from the `for` loop, can serve as a logical operator which checks if something  `<ins>` is in `</ins>` a string (or, in general, any other iterable):

```python
word = 'macintosh'
print('t' in word)
```

After running the above script you will see a boolean value `True`. As you can see this was much simpler. If you want to check if something `<ins>`is not`</ins>` present in a string, you can use the `not` operator to negate `in`:

```python
word = 'macintosh'
print('t' not in word)
```

The output of this script should be `False`.

Both `in` and `not in` look for occurrence in a string. It does not matter how many times a specific character is present in a string.

---

## 9.1. Greater or Less Than

In Python, you may use signs of inequality (`>, <`) even for characters or even strings with multiple characters! But to do it, you have to know how to determine which character is 'greater'. To have such knowledge you have to know what kind of characters we are using in Python, these are ASCII characters.

> ASCII, stands for American Standard Code for Information Interchange. It's a 7-bit character code where every single bit represents a unique character. On this webpage you will find 8 bits, 256 characters, ASCII table according to Windows-1252 (code page 1252) which is a superset of ISO 8859-1 in terms of printable characters. In the range 128 to 159 (hex 80 to 9F), ISO/IEC 8859-1 has invisible control characters, while Windows-1252 has writable characters. Windows-1252 is probably the most-used 8-bit character encoding in the world.

Basically, what you have to know is that each character has a number assigned to it. This numbers are not stored in a computer in the form you know,  another number system is used, but you do not have to dive into the details of this system right now. It's better if you just check how this works in practice. For instance:

- letters which are earlier in the alphabet are smaller than the ones which show up later:

  ```py
  >>> 'a' < 'b'
  True
  ```
- number characters are smaller than letters:

  ```py
  >>> '3' < 'c'
  True
  ```
- surprisingly, uppercase letters are smaller than lowercase:

  ```py
  >>> 'a' < 'A'
  False
  ```

You may find the detailed description of this method under this [link](https://www.ascii-code.com/). Take a closer look for the **DEC** column based on which Python decides which character is greater. For example, we can see that for `A` DEC=65 and for `z` DEC=122. Hence the letter `A` will be smaller than `z`. But as it was already said - there is no need for you to remember all the DEC numbers. Just remember more or less which characters are smaller and which are bigger - if you do not remember something you can just check it in e.g. inline mode.

Here is a simple code which prints all standard(ASCII) characters in ascending order:

```python
for i in range(35, 128):
    print(chr(i))
```

When you run these lines you will see the following characters:

    #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

---

---

---

---

# 10. Built-in string functions

You have already been using many built-in python functions like: `print()`, `len()`, `range()` etc. Some of them also work fine with strings. In this section we will talk about some specific functions related only to the strings, such functions are called *methods*.
Using methods is quite easy but differs slightly to the way in which we have been using `print()` or `len()`. The syntax is as follows `string.method_name`, firstly we have to type our string or variable to which a string is assigned, then we have to type a dot `.` and then after a dot one has to provide which method one wants to use. Let us see some simple examples:

```python
my_string = 'my first use of a method'
make_capitalize = my_string.capitalize()
print(make_capitalize)
replaced_word = my_string.replace('my', 'your')
print(replaced_word)
```

After you run such a simple example you should see:

    My first use of a method
    your first use of a method

You can probably figure out what methods `capitalize` and `replace` do. If you are not sure, you can check out these methods description in the next section.

---

## 10.1. String Methods

Strings implement all of the common sequence operations, along with the additional methods described below. The detailed description might be found in this [link] (https://docs.python.org/3/library/stdtypes.html#string-methods). Some useful build-in functions are listed in the table below:

|     | Method                                        | description                                                                                                                                                                                                                                                                                                    |
| --- | --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1.  | **.capitalize()**                       | Return a copy of the string with its first character capitalized and the rest lowercased.                                                                                                                                                                                                                      |
| 2.  | **.count(sub[, start[, end]])**         | Return the number of non-overlapping occurrences of substring sub in the range [start, end]. Optional arguments start and end are interpreted as in slice notation.                                                                                                                                            |
| 3.  | **.endswith(suffix[, start[, end]])**   | Return True if the string ends with the specified suffix, otherwise return False. suffix can also be a tuple of suffixes to look for. With optional start, test beginning at that position. With optional end, stop comparing at that position.                                                                |
| 4.  | **.find(sub[, start[ ,end]])**          | Return the lowest index in the string where substring sub is found within the slice s[start:end]. Optional arguments start and end are interpreted as in slice notation. Return -1 if sub is not found.                                                                                                        |
| 5.  | **.isnumeric()**                        | Return True if all characters in the string are numeric characters, and there is at least one character, False otherwise. Numeric characters include digit characters, and all characters that have the Unicode numeric value property.                                                                        |
| 6.  | **.lower()**                            | Return a copy of the string with all the cased characters 4 converted to lowercase.                                                                                                                                                                                                                            |
| 7.  | **.replace(old, new[, count])**         | Return a copy of the string with all occurrences of substring old replaced by new. If the optional argument count is given, only the first count occurrences are replaced.                                                                                                                                     |
| 8.  | **.split(sep=None, maxsplit=- 1)**            | Return a list of the words in the string, using sep as the delimiter string. If maxsplit is given, at most maxsplit splits are done (thus, the list will have at most maxsplit+1 elements). If maxsplit is not specified or -1, then there is no limit on the number of splits (all possible splits are made). |
| 9.  | **.startswith(prefix[, start[, end]])** | Return True if string starts with the prefix, otherwise return False. prefix can also be a tuple of prefixes to look for. With optional start, test string beginning at that position. With optional end, stop comparing string at that position.                                                              |
| 10. | **.upper()**                            | Return a copy of the string with all the cased characters 4 converted to uppercase. Note that s.upper().isupper() might be False if s contains uncased characters or if the Unicode category of the resulting character(s) is not “Lu” (Letter, uppercase), but e.g. “Lt” (Letter, titlecase).             |

**Remark!** Methods create a copy of a string. Method does not modify a variable, to do so you have to overwrite it or create a new one.

---

---

---

---

# 11. Regular expressions

Imagine you have a set of strings which are very similar, but differ by only one or two characters. E.g. you have lots of images which are named: `'image_01'`, `'image_02'`, `'image_03'`, and so on. Now, if you would like to change the `'image'` part into e.g. `'my_dog'` to better describe what the picture contains, you would have to do it for each string separately. Luckily, there is a concept known as [regular expression](https://docs.python.org/3/library/re.html) which allows you to define a 'pattern' of a string and then check whether a given string follows this pattern. To use regular expressions in Python we need to use the package `re`. Let us see how we can perform such an operation described in this example:

```python
import re
my_dir = ['image_01.png', 'image_02.png', 'image_03.png', 'image_04.png', 'image_05.png']
for i in range(len(my_dir)):
    my_dir[i] = re.sub('image', 'my_dog', my_dir[i])
print(my_dir)
```

In the example above we firstly import a `re` package which already contains all regular expressions functions which we will be using. Then we have defined a list with some sample strings, which we treat as files in our directory. As in the task above we want to change part of our files name from `image` into `my_dog`, to do so we will use a `re.sub` function. Our list contains 5 files so instead of doing it manually in inline mode like this:

    >>import re
    >>my_file = 'image_01.png'
    >>my_new_file = re.sub('image', 'my_dog', my_file)
    >>print(my_new_file)
    my_dog_01.png

We can do it in a loop, in which we will do exactly the same as in the example above. The `re.sub` works like this, we provide a `pattern` which will be replaced with the `repl` in the provided string. In our case `pattern` is a `'image'` and `repl` is a ` 'my_dog'`. So in a loop each string with a word `'image'` will be replaced with `'my_dog'`. However, in this particular case we would rather use string's `'replace()'` method, which should be more efficient. Nevertheless, regular expressions are very powerful and with knowledge about their special characters, we can easily build much more general patterns. If we write `[Ii]mages?`, we can except that the following words will be matched:

```
Image
Images
image
images
```

Special characters will be explained in a while.

Now we can move forward to two more examples of `re.` functions. `re.findall(pattern, string)` search for all matches of `pattern` in a given string. This function returns all repetition of `pattern`, in order to obtain the number of repetition we can just simply use a `len` function over return list from `re.findall` function. Let us do it with the beginning of nursery rhymes.

```python
rhymes = '''A sailor went to sea, sea, sea'''
print(len(re.findall("sea", rhymes)))
```

So in our example we are looking for each occurrence of `sea` word, we can simply calculate it manually, it is 3 times. 3 should be the answer from our function.

In regular expression sometimes we want to find some more complex pattern than a simple word or character. For instance we may want to check if our string starts and ends with some characters. Let us check if our string starts with `A` and ends with `sea`. Of course you may try to do it by splitting string into a single character and then matching them with some characters, but in fact you may do it with `re`. We will use a `re.match` function which checks if a given pattern matches a provided string. But how to check simultaneously the beginning and the ending of a string. We can do it with the use of special characters. To indicate the beginning of a string we will use `^` character before our pattern and then to indicate the end we will use `$` after the pattern. If we want to include something between the starting and ending of the pattern we may add `.*` which matches any characters with any number of repetition.

```python
import re

rhymes = '''A sailor went to sea1, sea2, sea3'''
print(len(re.findall("sea[1-9]", rhymes)))
```

---

Functions which are defined in it allow you to check if a particular string matches a given regular expression. The basic characters/operators used in this syntax:

| special character | how it works                                     |
| ----------------- | ------------------------------------------------ |
| .                 | matches any character except a new line          |
| [a-z]             | any character in the range in brackets([])       |
| [^a-z]            | any character not form the range in brackets([]) |
| ^                 | beginning of the string/line                     |
| $                 | end of the string/line                           |
| *                 | any number of repetition                         |
| ?                 | 0 or 1 repetition                                |
| +                 | 1 or more repetitions                            |
| {n, m}            | from n to m repetitions                          |
| \w                | any character from a-zA-Z0-9_                    |

These are examples of some special characters available for regular expressions. Now it is time to see how some functions from module `re` work:

| `re` module function                              | how it works                                                                                                                                                                                                                                                                                   |
| --------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **re.search(pattern, string, flags=0)**       | Scan through the string looking for the first location where the regular expression pattern produces a match and return a corresponding match object.                                                                                                                                          |
| **re.match(pattern, string, flags=0)**        | If zero or more characters at the beginning of string match the regular expression pattern, return a corresponding match object.                                                                                                                                                               |
| **re.split(pattern, string, maxsplit=0, flags=0)**  | Split string by occurrences of pattern. If capturing parentheses are used in pattern, then the text of all groups in the pattern are also returned as part of the resulting list.                                                                                                              |
| **re.sub(pattern, repl, string, count=0, flags=0)** | Return the string obtained by replacing the leftmost nonoverlapping occurrences of pattern in string by the replacement repl. If the pattern is not found, the string is returned unchanged. repl can be a string or a function; if it is a string, any backslash escapes in it are processed. |
| **re.findall(pattern, string, flags=0)**)     | Returns a list containing all matches of pattern.                                                                                                                                                                                                                                              |

More details about each function and much more are available under the [link](https://docs.python.org/3/library/re.html)

Now it is time to see some examples of regular expressions. Before that, we have to import a `re` module from Python. It is very easy to do, you just have to add this `import re` at the very beginning of your code.

```python
import re

test_1 = 'qq ww ee rr tt yy uu ii pp'
test_2 = 'qq ww ee rr ww ss ww ff gg'
```

Let us start with these 3 lines of code, and now we can test how regular expressions work step by step:

```python
if re.match(".*[qaws]", test_1):
    print('test_1 contains q or a or w or s')
```

The line above checks if any of `q,a,w,s` characters are in `test_1` string. It starts form the beginning of the string and stops when it meets all conditions.

```python
if re.match(".* ([a-z]{2}) .* \\1", test_2):
    print("test_2 contains two times the same part of `test_2` string")
```

The line above checks if any of the characters in the alphabet are in `test_2` string twice. Twice, because there is {2} in the syntax. `1 ` means a [backreferences] (https://www.pythontutorial.net/python-regex/python-regex-backreferences/) to subexpressions.

```python
print (re.sub('[we]+', "XX", test_2, 2))
print (re.sub('[we]+', "XX", test_2))
```

Now these two lines above are doing the same operation, but one in the upper line is limited to 2 substitutions. The function looks for `w` or `e` occurring at lest once and then substitutes it with `XX`.

---

## 11.1. Greedy

```python
print (re.sub('ww (.*) ww', "X \\1 X", test_2))
print (re.sub('.*ww (.*) ww.*', "\\1", test_2))
print (re.sub('.*?ww (.*) ww.*', "\\1", test_2))
```

In the first line, function `sub` found the longest possible match `ee rr ww ss`. In the second line, only the `ss` meets what was provided. The difference between these 2 lines is in `.*` which change a lot. The third line matches the longest possible `ee rr ww ss`, thanks to the usage of `.*?` which is not greedy in comparison to simle `.*`. After each of repetition operators `. ? + {n,m}` one may use `.? ?? +? {n,m}?` to indicate the use of this operator in not greedy way, to match the shortest possible match.

---

---

# 12. SAMPLE ANSWERS FOR EX.1 & EX.2

## 12.1. EX.1

```python
Import_quote = 'Whenever you look back and say "if" you know you\'re in trouble. There is no such thing as "if". The only thing that matters is what really happened.'

Import_quote = "Whenever you look back and say \"if\" you know you're in trouble. There is no such thing as \"if\". The only thing that matters is what really happened."

Import_quote = """Whenever you look back and say "if" you know you're in trouble. There is no such thing as "if". The only thing that matters is what really happened."""
```

**NOTE**

In the 2nd example above we have used `\"if\"` to allow for `"if"` inside our string. Using `\` escapes meaning of the `"` character, which is called an escape sequence. This mean that Python will remove the backslash, and put just `"..."` in the string.

---

## 12.2. EX.2

```py
name = 'Ignacy'
surname = 'Lukasiewicz'
place_of_birth = 'Zaduszniki'
age = 59
occupation = 'Pharmacist, engineer, businessman, inventor, philanthropist'

information_about_patron = "name = {}\nsurname = {}\nplace_of_birth = {}\nage = {}\noccupation = {}".format(name, surname, place_of_birth, age, occupation)
```

```py
>>> print(information_about_patron)
name = Ignacy
surname = Lukasiewicz
place_of_birth = Zaduszniki
age = 59
occupation = Pharmacist, engineer, businessman, inventor, philanthropist
```

---

---

# 13. Exercises

## 13.1. EX. 3 (0.5 points)

Code a function `length`, which takes string as an argument and calculates the length of it. You are not allowed to use the built-in function `len`. Use any loop you want. Examples:

```py
>>> length('dog')
3
>>> length('')
0
>>> length('lazarski')
8
```

Good luck! Check that most likely your function works correctly also with different types of objects, such as list, tuple, set, and dictionary.

---

## 13.2. EX. 4 (0.5 points)

Code a function `last_char`, which takes string as an argument and returns the last character of it. You are not allowed to use the `[-1]` index. Examples:

```py
>>> last_char('dog')
'g'
>>> last_char('')
''
>>> last_char('lazarski')
'i'
```

Good luck!

---

## 13.3. EX. 5 (1 point)

Code a function `word_backwards`, which takes string as an argument and returns it in a reverse order. Examples:

```py
>>> word_backwards('dog')
'god'
>>> word_backwards('lazarski')
'iksrazal'
>>> word_backwards('')
''
```

Good luck!

---

## 13.4. EX. 6 (1 point)

Code a function `abbreviation`, which will create an abbreviation of words provided in a list. The function returns the first and the last character of the word as well as its length in a list. Examples:

```py
>>> abbreviation(['Lazarski', 'University'])
['L-i (8)', 'U-y (10)']
>>> abbreviation(['dog', 'cat', 'snake', 'lion'])
['d-g (3)', 'c-t (3)', 's-e (5)', 'l-n (4)']
>>> abbreviation(['', 'a'])
[' -  (0)', 'a-a (1)']
```

---

## 13.5. EX. 7 (1 point)

Imagine that you are working with some software which is doing some repeatable operations. For example, let it be an ATM, which checks if the card is ok, then asks for the PIN code and finally asks for the amount to withdraw. Such an operation in a database may look like this `transaction_nr ='card_number, PIN_code, amount_to_withdraw'`, where `transaction_nr` is a string. Your task is to code a function `how_much(transaction_nr)`, which will return the `money_to_withdraw` equal to `amount_to_withdraw` which will be an integer. Examples:

```py
>>> how_much('123, 3210, 450')
450
>>> how_much('470015866, 1949, 1984')
1984
```

Good luck!

---

## 13.6. EX. 8 (1 point)

Code a `make_xX` function, which takes string as an argument and modifies all characters (Latin alphabet letters) to x or X depending on if it was a lowercased or capitalized letter. Other characters should not be modified. This function returns a string with the correct characters corresponding to the pattern. Examples:

```py
>>> make_xX('dog')
'xxx'
>>> make_xX('Lazarski')
'Xxxxxxxx'
>>> make_xX('The 1984 was written by Orwell and published in 1949.')
'Xxx 1984 xxx xxxxxxx xx Xxxxxx xxx xxxxxxxxx xx 1949.'
```

The re package may be helpful. Good luck!

---

## 13.7. EX. 9 (1 point)

Define a function called `get_words`, which takes a string as an argument and returns a list with words from it. For this task, we consider words as a sequence of at least two characters which are either a letter, number or underscore. Examples:

```py
>>> get_words('You miss 100% of the shots you don’t take – Wayne Gretzky – Michael Scott')
['You', 'miss', '100', 'of', 'the', 'shots', 'you', 'don', 'take', 'Wayne', 'Gretzky', 'Michael', 'Scott']
>>> get_words('That is how it should work to get 1 point (100% percent of points) from this exercise')
['That', 'is', 'how', 'it', 'should', 'work', 'to', 'get', 'point', '100', 'percent', 'of', 'points', 'from', 'this', 'exercise']
```

It is necessary to use re package for this exercise. Good luck!

---

## 13.8. EX. 10 (1 point)

Define a function called `get_words_with_letter`, which takes two arguments, a string with text and a string with some character. It returns a list with all the words from the text, which consists a provided letter. Examples:

```py
>>> get_words_with_letter('Jackdaws love my big sphinx of quartz.', 'a')
['Jackdaws', 'quartz']
>>> get_words_with_letter('Lazarski', 'x')
[]
>>> get_words_with_letter('A few years ago, my family was on a safari in Africa, and my cousin, Mufasa, was... He was trampled to death by a pack of wildebeests, and we all took it really hard.', 's')
['years', 'was', 'safari', 'cousin', 'Mufasa', 'was', 'was', 'wildebeests']
```

It is necessary to use re package for this exercise. Good luck!

---

## 13.9. EX. 11 (3 points)

> [PESEL](https://en.wikipedia.org/wiki/PESEL) is the national identification number used in Poland since 1979. The number is 11 digits long, identifies exactly one person, and cannot be changed once assigned, except in specific situations (such as gender reassignment).

To create a proper PESEL number one must obey a few rules; for the purpose of this exercise we would consider only PESEL numbers for those born between 1900 and 1999. Let's assume that we would want to check if `26030836479` is a valid pesel number. We can do it calculating the following expression:

$$
c_1\cdot1 + c_2\cdot3 + c_3\cdot7 + c_4\cdot9 + c_5\cdot1 + c_6\cdot3 + c_7\cdot7 + c_8\cdot9 + c_9\cdot1+c_{10}\cdot3+c_{11}\cdot1,
$$

where:

| $2$   | $6$   | $0$   | $3$   | $0$   | $8$   | $3$   | $6$   | $4$   | $7$      | $9$      |
| ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ---------- | ---------- |
| $c_1$ | $c_2$ | $c_3$ | $c_4$ | $c_5$ | $c_6$ | $c_7$ | $c_8$ | $c_9$ | $c_{10}$ | $c_{11}$ |

Now we have to check if the last digit of the result is equal to `0`. The output of this expression for the number `26030836479` is . For the PESEL number `39090109215` the output of the expression is `205`, so this is not a valid PESEL number. Moreover, having PESEL number we can check what was the date of birth and what is the gender of a person. Two first digits are the year, the next two are a month and the next a day of someone's birthday. The gener is coded in the tenth number. If it is an even number, it is female's number. If it is an odd number, it is male's number. Your task is to code a `check_PESEL` function, which takes string as an argument and returns one of the following:

1. If the PESEL number is incorrect, based on the provided expression, the function should return `'Invalid PESEL, control number: number'`, where second number is the result of the provided expression.
2. If the PESEL number is correct, return a list:

   [year, month, day, gender]

   where year, month and day are integers, and gender should be `F` for female, and `M` for male.

Examples:

```py
>>> check_PESEL('39090109215')
'Invalid PESEL, control number: 205'
>>> check_PESEL('70091288341')
'Invalid PESEL, control number: 239'
>>> check_PESEL('01291688265')
[1901, 29, 16, 'F']
>>> check_PESEL('65061364434')
[1965, 6, 13, 'M']
```

If you need more examples, you can use PESEL generator from [this site](https://pesel.cstudios.pl/o-generatorze/generator-on-line). Good luck!
