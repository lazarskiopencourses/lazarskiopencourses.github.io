---
title: "Iterables"
excerpt: "Module about iterables"
toc: true
toc_sticky: true
---
<script src="https://unpkg.com/vanilla-back-to-top@7.2.1/dist/vanilla-back-to-top.min.js"></script>

<script>addBackToTop()</script>

---

In this module, we will talk about and compare four types of iterables: lists, dictionaries, sets, and tuples. However, this is not an introduction to two of these data types - we assume you have already heard about lists and dictionaries. When you first heard about them, you did not have enough experience to understand the subtle details of these structures. Now you are ready. Hence, the goal of this chapter is to walk you through these data types in detail to give you a good understanding of how they work and what you can achieve with them. Firstly we should discuss general aspects of iterables. Then, we will be ready to expand our knowledge about specific examples of iterables such as lists, dictionaries, sets or tuples.

---
---

# 1. Scripts

<a href="https://github.com/lazarskiopencourses/lazarskiopencourses.github.io/tree/master/courses/programming_in_python/03_iterables/scripts/">Iterables scripts</a>

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

# 3. Iterables

We should know already that an iterable is an object which can be used with loops. We covered this topic during the [Loops and iterables](https://lazarskiopencourses.github.io/courses_in_english/introduction_to_programming_in_python/04_loops_and_iterables/) module from Introduction to Programming in Python course. Basically an iterable is an object where you can go through its elements one by one. Just as you can go through e.g. members of a football team and, for instance, count them.

In programming terms, this means that iterables are objects which have an iterator. The iterator knows where in the iterable we currently are and can point us to the next value. For example, if we type:

```python
>>> iterator = iter('I am an iterator.')
```

We can check which element of an object `'I am an iterator'` is next:

```python
>>> next(iterator)
'I'
```

Until there will be no more elements left:

```
>>> next(iterator)
' '
>>> next(iterator)
'a'
>>> next(iterator)
'm'
>>> next(iterator)
...
>>> next(iterator)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```

Every iterable must have a method called `__iter__` - this allows you to use the `iter` function on it to generate an iterator. It goes also in the other direction: every object which has the `__iter__` method is an iterable.

As for the iterator, each such object must have two methods: `__next__` and `__iter__`. Note that this means that an iterator is also an iterable, becuase it has the `__iter__` method! The method `__next__` allows us to use the function `next` on the iterator. You have already seen an example of such usage. If we use the `next` function with an argument which is not an iterator, we will see an error message:

```python
>>> next([1,2,3])
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'list' object is not an iterator
```

Why it matters? We will see during the `Advanced programming in Python` course that having this knowledge we are able to create objects which we can iterate through. The thing about iterators which can be handy is the fact that if we properly define our iterator, it doesn't need to have an end and we can loop through it infinitely. For example, iamgine that you forgot your password and so you would like to crack it. Trying to create a list of every combination of words or numbers - which in theory can be infinite - will not get you far, because your computer wouldn't be able to store it. Correctly defined iterator could help you lighten your computer memory. You would simply check the passswords one by one until you find the right one - without the need to store them all at once. Of course in real world scenario passwords have limited number of characters. Nevertheless, from the perspective of your computer - which has a limited amount of memory - the amount of possible combinations is so huge that it's like infinity.

The most important thing to remember from this section is that strings, lists and dictionaries are iterables. The same goes for sets and tuples which you will learn about shortly. We finish this part solving the following exercise:

---

## 3.1. EX. 1 (1 point)

Define a function `is_iter` which checks if a specific object is iterable, returning a relevant boolean. For example:

```py
>>> is_iter([1, 2])
True
>>> is_iter('abcd')
True
>>> is_iter(5)
False
```

The built-in function `dir` should be helpful. We talked about it during the last module. Good luck!

---
---

# 4. Lists

## 4.1. Recap

You should know lists from the module [Lists and dictionaries](https://lazarskiopencourses.github.io/courses_in_english/introduction_to_programming_in_python/05_lists_and_dictionaries/). It is one of the most commonly used data types which keeps order of the elements. Its creation is very simple. Quick recap:

- defining:

  ```python
    constants = [3.14, 9.81] # or list(3.14, 9.81)
  ```
- accessing elements:

  ```python
    >>> constants[-1]
    9.81
  ```
- adding an element at the end:

  ```python
    constants.append(1.62)
  ```
- concatenation by adding elements at the end:

  ```python
    constants += [2.72, 299792458] # or constants.extend([2.72, 299792458])
  ```
- modifying elements:

  ```python
    constants[0] = 3.14159265359
  ```
- slicing:

  ```python
    >>> constants[1:3]
    [9.81, 1.62]
  ```
- deleting elements:

  ```python
    constants.remove(2.72) # removes the first occurrence of particular element
    constants.pop(0) # removes first element at index 0
    del constants[1] # removes element at index 1
  ```
- built-in functions:

  - **sum**

  ```py
    >>> constants = [3.14, 9.81, 1.62, 2.72]
    >>> sum(constants)
    17.29
  ```

  - **max**

  ```py
    >>> max(constants)
    9.81
  ```

  - **min**

  ```py
    >>> min(constants)
    1.62
  ```
- iterating through elements:

  ```python
    for constant in constants:
        print(constant)
  ```

  With an option to modify all the elements:
  ```py
    for i in range(len(constants)):
        constants[i] = i**2
  ```

Additionally, we can create a list from a string:

```python
>>> list('abcd')
['a', 'b', 'c', 'd']
```

You can test your basic knowledge about lists by solving the following exercise.

---

## 4.2. EX. 2 (1 point)

Define a function called **product**, which expects a list as an argument. Function should return the product of all the numbers stored in the list. For example:

```py
>>> product([1, 2, 3, 4])
24
>>> print(product([]))
None
>>> product([-523, 125, 0, 62])
0
```

Please name your script with a definition of this function as `ex_1_product`. Good luck!

---

## 4.3. List Methods

In the table below you can find the most important methods for `lists`. You have already used some of them. Now it's time to cover this topic in full extent.

| Method    | Description                                                    |
| --------- | -------------------------------------------------------------- |
| append()  | Add an element at the end of the list                          |
| clear()   | Clear the whole list. Remove all elements from the list        |
| copy()    | Returns a copy of the list                                     |
| count()   | Returns the number of elements with the specified value        |
| extend()  | Add the elements of a list or other object to the current list |
| index()   | Returns the index of the first element with the specific value |
| insert()  | Add a element to a specific position/index                     |
| pop()     | Removes the element at the specific position                   |
| remove()  | Removes the first item with the specific value                 |
| reverse() | Reverse the order in the list                                  |
| sort()    | Sorts the list                                                 |

Based on this [link](https://www.w3schools.com/python/python_ref_list.asp). In the following subsections we will cover all of these methods with examples. We will start by creating a list with dog breeds:

    >>> dog_breeds = ['buldog', 'labrador', 'chihuahua', 'husky', 'akita', 'dalmatian', 'pug', 'boston terrier', 'boxer']

which will be used in examples.

---

### 4.3.1. `reverse`

So let's say that for some reason we want to have a `list` with the same elements, but in reversed order. We can achieve this using `reverse` method:

    >>> dog_breeds.reverse()
    >>> dog_breeds
    ['boxer', 'boston terrier', 'pug', 'dalmatian', 'akita', 'husky', 'chihuahua', 'labrador', 'buldog']

Note that we did not assign any new variable to the result of the `dog_breeds.reverse()` call. The changes were applied to the object to which the variable was pointing. That is why if we do something like this:

    >>> a = [1, 2, 3]
    >>> b = a
    >>> b.reverse()

the changes will be visible in both variables:

    >>> b
    [3, 2, 1]
    >>> a
    [3, 2, 1]

It has to be like this, because these variables point to the same object! Lists are mutable and we will talk about this more during the next module. The `reverse` method changes the object on which the method was called. As we will see, we can have a method which falls into both these categories.

---

### 4.3.2. `sort`

What if we want to have the `list` sorted in the alphabetical order? We can easily do it using the `sort` method:

    >>> dog_breeds.sort()
    >>> dog_breeds
    ['akita', 'boston terrier', 'boxer', 'buldog', 'chihuahua', 'dalmatian', 'husky', 'labrador', 'pug']

You can clearly see that the `sort` method is a method which changes the object itself. It does not generate a new list.

The `sort` method sorts the elements of the list according to the result of `<` operator. So, for a list of strings this order will be determined by the DEC value of ASCII characters as we discussed in the strings chapter. For a list of numbers it will be smaller numbers first:

    >>> numbers = [3, 1.5, 8, -1]
    >>> numbers.sort()
    >>> numbers
    [-1, 1.5, 3, 8]

Note that python has to be able to compare the elements of a `list` to sort it. So, if you have a list with elements which cannot be compared to one another, you will not be able to `sort` it:

    >>> numbers_and_letters = ['m', 2, 'a', 1]
    >>> numbers_and_letters.sort()
    Traceback (most recent call last):
      File "`<stdin>`", line 1, in `<module>`
    TypeError: '<' not supported between instances of 'int' and 'str'

---

### 4.3.3. `index`

How can we check what is the index of a given element? We can do it with the `index` method:

    >>> dog_breeds
    ['akita', 'boston terrier', 'buldog', 'dalmatian', 'husky', 'labrador', 'pug']
    >>> dog_breeds.index('husky')
    4

As you can see, you provide the `index` method with the value of interest and it gives you back an index of the first element which matches this value. Similarly to the `remove` method, if there is no element matching the given argument, you will get an error:

    >>> dog_breeds.index('chihuahua')
    Traceback (most recent call last):
      File "`<stdin>`", line 1, in `<module>`
    ValueError: 'chihuahua' is not in list

and if there is more than one match, you will find only the first one:

```py
>>> numbers = [1, 2, 1, 3, 1]
>>> numbers.index(1)
0
```

---

### 4.3.4. `insert`

But what if we want to add an element in a specific place? We can do it using the insert method:

    >>> dog_breeds.insert(3, 'cundle burry')
    >>> dog_breeds
    ['akita', 'boston terrier', 'buldog', 'cundle burry', 'dalmatian', 'husky', 'labrador', 'pug', 'golden retriever']

As you can see, the `insert` method takes two arguments: an index at which we want to add an element and the element which is to be added. Surprisingly, if you use an index which exceeds the `list` length, python does not throw an error but simply adds the element at the end of the list:

    >>> len(dog_breeds)
    9
    >>> dog_breeds.insert(20, 'burry cundle')
    >>> dog_breeds
    ['akita', 'boston terrier', 'buldog', 'cundle burry', 'dalmatian', 'husky', 'labrador', 'pug', 'golden retriever', 'burry cundle']

---

### 4.3.5. `clear`

Using the `clear` method is very important if you are working with a very long `list`, i.e. a `list` which contains a lot of data. When such a list is no longer needed, we should clear it to release the memory. Since we are finished with our examples, we can clear the `dog_breeds`:

```py
>>> dog_breeds.clear()
>>> dog_breeds
[]
```

As you can see, the list has not been deleted! The object still exists. It has just became an empty list. Feel free to use the `id` built in function to check that a `list` object has the same `id` before and after the `clear` call.

---

---

# 5. Dictionaries

## 5.1. Recap

During one of the most contentful modules so far, [Lists and dictionaries](https://lazarskiopencourses.github.io/courses_in_english/introduction_to_programming_in_python/05_lists_and_dictionaries/), you have learnt about dictionaries. We know that a dictionary should have a following structure:

```python
dictionary = {key_1: value_1, key_2: value_2, key_3: value_3, ...}
```

Which is more readable to write in the following way:

```python
dictionary = {
    key_1: value_1, 
    key_2: value_2, 
    key_3: value_3,
    ...
    }
```

All the Python objects can be a value in the dictionary. But you need to remember that keys must be unique and so they have to be immutable. Let's do a quick recap of basic operations fro dictionaries. First let us define a dictionary called **polish_mathematicians** with names of the mathematicians as keys and years of their birth as values:

```python
polish_mathematicians = {
    'Banach': 1892,
    'Steinhaus': 1887,
    'Ulam': 1909,
    'Lebesgue': 1875
}
```

- accessing elements:

  ```python
    polish_mathematicians['Banach'] 
    # or 
    polish_mathematicians.get('Ulam')
  ```

  The difference between these two ways is the behaviour when a specific key is not a part of the dictionary:

  - key as an index:

  ```
    >>> polish_mathematicians['Tarski']
    Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    KeyError: 'Tarski'
  ```

  - .get method:

  ```
    >>> polish_mathematicians.get('Tarski')
    None
  ```

  Actually, Tarski was considered more of a logician... One rabbi says that logic is a part of mathematics, and the other rabbi says it is not. But he also has done a lot for mathematics. If you are interested, see for example [The Banach-Tarski paradox](https://en.wikipedia.org/wiki/Banach%E2%80%93Tarski_paradox).
- adding an element:

  ```
    polish_mathematicians['Kuratowski'] = 1896
  ```
- deleting an element:

  - using the **del** keyword

  ```
    >>> del polish_mathematicians['Lebesgue']
  ```

  - using the **.pop** method, which returns the value of deleting key

  ```
    >>> polish_mathematicians.pop('Lebesgue')
    1875
  ```

  - to delete all elements, use **clear**:

  ```
    >>> polish_mathematicians.clear()
  ```
- modifying existing elements:

  - changing the value

  ```
    polish_mathematicians['Steinhaus'] = '14.01.1887'
  ```

  - changing the key - in this case, we must delete an element, so we have got two options

  ```
    >>> polish_mathematicians['Hugo Steinhaus'] = polish_mathematicans['Steinhaus']
    >>> del polish_mathematicans['Steinhaus']
    # and one-line solution
    >> polish_mathematicians['Hugo Steinhaus'] = polish_mathematicians.pop('Steinhaus')
  ```
- iterating through the dictionary:

  - through the keys

  ```python
    for key in polish_mathematicians:
        print(key)
        print(polish_mathematicians[key])
  ```

  - through the values:

  ```python
    for value in polish_mathematicians.values():
        print(value)
  ```

  - through the keys and values:

  ```python
    for key, value in polish_mathematicians.items():
        print(key, value)
  ```

Again, we have prepared an exercise which you can use to test your knowledge about dictionaries.

---

## 5.2. EX.2 (1 point)

Define a function called `mapping` that expects one argument of type `list` and returns a dictionary. The `keys` should be equal to the following numbers from the list and the `values` should be equal to the value of a polynomial $W(x) = 2x^3 + 4x -7$ where `x` is a respective `key`. For example:

```py
>>> mapping([1,2,3,4,5,6])
{1: -1, 2: 17, 3: 59, 4: 137, 5: 263, 6: 449}
>>> mapping([10,0,-10,5,1])
{10: 2033, 0: -7, -10: -2047, 5: 263, 1: -1}
>>> print(mapping([]))
None
```

Please name your script with a definition of this function as `ex_2_mapping`. Good luck!

---

## 5.3. Dictionaries Methods

Similarly as we did with `lists`, we will now walk through the most important dictionary methods. In the table below you can find summary of the methods we will cover.

| Method       | Description                                                                                                 |
| ------------ | ----------------------------------------------------------------------------------------------------------- |
| keys()       | Returns a list containing the dictionary's keys                                                             |
| values()     | Returns a list of all the values in the dictionary                                                          |
| items()      | Returns a list containing a tuple for each key value pair                                                   |
| get()        | Returns the value of the specified key                                                                      |
| pop()        | Removes the element with the specified key                                                                  |
| popitem()    | Removes the last inserted key value pair                                                                    |
| clear()      | Removes all the elements from the dictionary                                                                |
| copy()       | Returns a copy of the dictionary                                                                            |
| fromkeys()   | Returns a dictionary with the specified keys and value                                                      |
| update()     | Updates the dictionary with the specified key value pairs                                                   |
| setdefault() | Returns the value of the specified key. If the key does not exist: insert the key, with the specified value |

---

### 5.3.1. `fromkeys`

The `fromkeys` is a built-in method that allows one to create a dictionary faster and easier than providing all data manually. For instant, imagine that you want to create a dictionary with names of United States president names as `keys` and the time they have spent in office as `values`. Most of the presidents spent 8 years in office. Instead of assigning all of the years by hand for each president, you can create a list of presidents:

    >>> presidents = ['George Washington', 'John Adams', 'Thomas Jefferson', 'James Madison', 'James Monroe', 'John Quincy Adams', 'Donald Trump']

and then create a dictionary with a default, most common `value` using the method `fromkeys`. But wait, how can we use a method if we have no dictionary yet? Well, it turns out that in python you can sometimes use a method by referring to a class of objects instead of one specific object from this class. In this case, we are referring to the `dict` class, so we can use the `fromkeys` method like this:

    >>> president_office_years = dict.fromkeys(presidents, 8)
    >>> president_office_years
    {'George Washington': 8, 'John Adams': 8, 'Thomas Jefferson': 8, 'James Madison': 8, 'James Monroe': 8, 'John Quincy Adams': 8, 'Donald Trump': 8}

We will talk more about classes later on. For now, just think of them as collections of objects of the same `type`. Finally, we can change only the values in our dictionary which should be different than our default value:

    >>> president_office_years['Donald Trum'] = 4
    >>> president_office_years
    {'George Washington': 8, 'John Adams': 8, 'Thomas Jefferson': 8, 'James Madison': 8, 'James Monroe': 8, 'John Quincy Adams': 8, 'Donald Trump': 8, 'Donald Trum': 4}

---

### 5.3.2. `sorted()`

`sorted()` is a function that returns a list with sorted key values of the given dictionary.

    >>print(sorted(presidents))
    ['George Washington', 'James Madison', 'James Monroe', 'John Adams', 'John Quincy Adams', 'Thomas Jefferson']
Sometimes you may want to sort your dictionary in descending order (by default it is sorted in ascending order) to do so you should use a flag`reverse = True`. So the example above would look like:

    >>print(sorted(presidents, reverse = True))
    ['Thomas Jefferson', 'John Quincy Adams', 'John Adams', 'James Monroe', 'James Madison', 'George Washington']
Another good feature of`sorted()` is a flag `key`, which allows for providing a key based on which sorting would take place. For instant we can sort by the length of each dictionary key. We will use a built-in Python function `len`.

    >>print(sorted(presidents, key=len))
    ['John Adams', 'James Monroe', 'James Madison', 'Thomas Jefferson', 'George Washington', 'John Quincy Adams']

---

### 5.3.3. `setdefault()`

`setdefault()` is a function that searches for a given key, and if the key does not exist, insert the key, with the specific value. Let us see how these functions work

    >>print(presidents.setdefault("Bush", 9)) #There is no Bush in presidents
    9
    >>print(presidents) #Now you can see Bush in presidents
    {'George Washington': 8, 'John Adams': 8, 'Thomas Jefferson': 8, 'James Madison': 8, 'James Monroe': 8, 'John Quincy Adams': 8, 'Bush': 9}

---

---

# 6. Tuples

## 6.1. What is a `tuple`?

Tuples are a built-in data type very similar to lists. The main difference is that tuples are immutable. We will talk about this in depth in the next module. You may think of a tuple like a list which cannot be modified - however, note that this is not exactly true as we will discuss in the next module. Typically tuples are used to store some important and unchangeable data/information.

---

## 6.2. Creating `tuples`

An example of such usage might be a calendar which can store abbreviated names of months as its elements:

    >>> calendar = ('jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec')

As you can see you can create a tuple almost in the same manner as you create a list - simply use round brackets instead of square ones. Since the names of months most likely will not change, it is better to use a tuple than a list here. A tuple might be also a good solution for storing some personal data of employees or some bank account numbers.

There might be also other, more technical reasons to use tuples instead of lists if it is indeed possible. Operations on tuples, such as assigning values from a tuple or accessing an element, should - in theory - perform faster. Moreover, tuples don't over-allocate our memory, because we do not have to care about possible changes - tuples are immutable. In other words, if we want a list append method to perform efficiently, we need to have some memory reserved for some possible additional elements. Since tuples have a fixed size, they don't need that, so their size is smaller. Note however, that this is a general and theoretical discussion of the data structures. In practice the performance metrics might depend on how a specific programming langauge is implemented. For example, it might be that in a given programming langauge there is no distinguishable difference in performance between lists and tuples. That is why we will compare the performance of lists and tuples in Python in the next module.

There is also another way to create a tuple. If we have another iterable object we can convert it to the `tuple` type using the `tuple` function - the same way as we used the `list` function:

    >>> t_1 = tuple([1,2,3,4,5,8])
    >>> t_1
    (1, 2, 3, 4, 5, 8)
    >>> t_2 = tuple("someone")
    >>> t_2
    ('s', 'o', 'm', 'e', 'o', 'n', 'e')

Notable is the fact that if you wish to create a tuple with only one element, you have to do it like this:

    >>> one_element_tuple = (1,)
    >>> one_element_tuple
    (1,)

Try to guess what type of object you will get if you omit the comma in the expression above. You can check with the `type` function if your predictions were correct.

---

Similarly to `lists`, you can create a `tuple` which contains different data types like `int`, `str`, `float` or `bool`:

    >>> a = (2, 3, 4, 4.5, True, 'dog')
    >>> a
    (2, 3, 4, 4.5, True, 'dog')

---

Now let's quickly go through some basic operations on tuples.

## 6.3. Accessing Elements of a tuple

As simple as accessing an element from the list. We can use indices to do that. So the only thing which needs to be done to access the first element is:

```
>>> a = (2, 3, 4, 4.5, True, 'dog')
>>> a[0]
2
```

The negative indices, the slicing, and the `in` operator work exactly the same.

---

## 6.4. Built-in functions - Tuples

The spectrum of built-in functions for tuple is much narrower than for list and dictionary, but you can use functions like `len`, `min` or `max`. They work similarly as with lists or dictionaries.

```py
>>> my_tuple = tuple(range(9))
>>> print(len(my_tuple), min(my_tuple), max(my_tuple))
9 0 8
```

## 6.5. Tuples can be keys in dictionary

Since tuples are immutable, if you need a composite keys in dictionary, you can use them. For example:

```py
my_dict = {
  (1, 2): 3,
  (4, 5): 9
}
```

```py
>>> my_dict[1,2]
3
```

---

---

Check that you cannot do this with lists.

# 7. Sets

In the beginning, sets may be seen as very similar to lists or tuples, but their role differs. They are also mutable objects like lists ro dictionaries. You use sets when you:

1. don't need ordering of items
2. your elements are unique (you don't need duplicates)
3. you care about time optimization.

Sets can be created in a following manner:

```python
>>> ranges = {'Andes', 'Carpathians', 'Alps', 'Himalayas'}
```

But the order usually is not kept!

```python
>>> print(ranges)
{'Andes', 'Himalayas', 'Carpathians', 'Alps'}
```

This order may be different on your computer. We can't use indices to get specific element, because sets are not subscriptable:

```python
>>> print(ranges[0])
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'set' object is not subscriptable
```

And that is why we cannot consider them as a sequence (i.e. there is no order of elements). Of course, as it was with tuples, lists and dictionaries, sets also can contain different types of elements. What exactly we can do with this structure?

- adding elements:

  ```python
    >>> ranges.add('Sudetes')
    >>> print(ranges)
    {'Carpathians', 'Himalayas', 'Sudetes', 'Andes', 'Alps'}
  ```

  Please check that this time also order was changed.
- looping through elements:

  ```python
    >>> for element in ranges: print(element)
    ...
    Carpathians
    Himalayas
    Sudetes
    Andes
    Alps 
  ```
- removing elements:

  - using the remove method

  ```python
    >>> ranges.remove('Himalayas')
    >>> print(ranges)
    {'Carpathians', 'Sudetes', 'Andes', 'Alps'}
    >>> ranges.remove('Karakoram')
    Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    KeyError: 'Karakoram'
  ```

  - using the discard method

  ```python
    >>> ranges.discard('Alps')
    >>> print(ranges)
    {'Carpathians', 'Sudetes', 'Andes'}
    >>> ranges.discard('Karakoram') # Karakoram is still not in the set
    None
  ```

  - using the pop method, which deletes the random element from the set and returns it

  ```python
    >>> ranges.pop()
    'Carpathians'
  ```

  - clear method for removing all the elements:

  ```python
    ranges.clear()
  ```
- concatenation of sets $\text{A}\cup\text{B}=\{x: x\in \text{A}\lor x\in \text{B}\}$

  ```python
    >>> switzerland_neighbors = {'France', 'Italy', 'Liechtenstein', 'Germany', 'Austria'}
    >>> austria_neighbors = {'Germany', 'Czechia', 'Slovakia', 'Hungary', 'Slovenia', 'Italy', 'Switzerland', 'Liechtenstein'}
    >>> switzerland_neighbors.union(austria_neighbors) 
    {'Italy', 'Czechia', 'Austria', 'Switzerland', 'Slovakia', 'France', 'Liechtenstein', 'Hungary', 'Slovenia', 'Germany' # or austria_neighbors.union(switzerland_neighbors)
  ```
- intersection of sets $\text{A}\cap\text{B}=\{x: x\in \text{A}\wedge x\in \text{B}\}$

  ```python
    >>> switzerland_neighbors.intersection(austria_neighbors) 
    {'Liechtenstein', 'Italy', 'Germany'} # or austria_neighbors.intersection(switzerland_neighbors)
  ```
- difference

  - $\text{A}\setminus\text{B}=\{x: x\in \text{A}\wedge x\not\in \text{B}\}$

  ```python
    >>> switzerland_neighbors - austria_neighbors
    {'Austria', 'France'} # or switzerland_neighbors.difference(austria_neighbors)
  ```

  - $\text{B}\setminus\text{A}=\{x: x\not\in \text{A}\wedge x\in \text{B}\}$

  ```python
    >>> austria_neighbors - switzerland_neighbors
    {'Czechia', 'Switzerland', 'Slovakia', 'Hungary', 'Slovenia'} # or austria_neighbors.difference(switzerland_neighbors)
  ```
- symmetric difference $\text{A}\Delta\text{B}=\{x: \left(x\in \text{A}\wedge x\not\in \text{B}\right)\lor \left(x\not\in \text{A}\wedge x\in \text{B}\right)\}$

  ```python
    >>> switzerland_neighbors.symmetric_difference(austria_neighbors)  
    {'Czechia', 'Austria', 'Switzerland', 'Slovakia', 'France', 'Hungary', 'Slovenia'}
  ```
- checking if one set is a subset of the other $\text{A}\overset{?}{\sub}\text{B}$

  ```python
    >>> european_union_countries = {'Austria', 'Belgium', 'Bulgaria', 'Croatia', 'Cyprus', 'Czechia', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Ireland', 'Italy', 'Latvia', 'Lithuania', 'Luxembourg', 'Malta', 'Netherlands', 'Poland', 'Portugal', 'Romania', 'Slovakia', 'Slovenia', 'Spain', 'Sweden'}
    >>> central_european_union_countries = {'France', 'Austria', 'Luxembourg', 'Czechia', 'Slovakia', 'Slovenia', 'Hungary'}
    >>> central_european_union_countries.issubset(european_union_countries) # or european_union_countries.issuperset(central_european_union_countries)
    True
    >>> central_european_union_countries.issuperset(european_union_countries) # or european_union_countries.issubset(central_european_union_countries)
    False
  ```

The most important advantages of sets are the possibility to conduct all the set operations. Furthermore, since the order of the set is not determined, checking if a set contains a particular value can be significantly faster than for lists.

---

In addition, checking the unique characters of a string (or unique elements of a list) has never been so easy:

```python
>>> some_long_word = 'senselessness' 
>>> unique_letters = set('senselessness')
>>> unique_letters
{'s', 'e', 'l', 'n'}
>>> len(unique_letters)/len(some_long_word)
0.3076923076923077
```

This was possible, because in a set you do not have duplicates. Hence after converting the string `'senselessness'` to a set only one unique representative of each character wes kept.

---

There is also a data type called `frozenset`, and as you may guess, this is an immutable set. The usage of it doesn't differ much from the set. If you are interested, you can read about it [here](https://docs.python.org/3/library/stdtypes.html#frozenset).

---

---

# 8. EXERCISES

## 8.1. EX.3 (4 points)

All-time battle: The Rolling Stones vs. AC/DC.

Your aim is to create an analytical tool that will allow you to prepare an argument in favour of one band about the number of unique words used in song lyrics. Your tool will be tested with one song from each rock band. The band with the highest number of unique words in the song wins. This task is divided into 4 subtasks in order to make the whole exercise simpler to understand.

---

### 8.1.1. EX.3 a) (1 point)

Write a function `clean` that expects a list filled with strings. This function returns a list with cleaned strings without characters like `':', ';', '!', '?', '.', ',', '\n', '"', '-', '*',"'",'(',')'`, as well as all letters modified to lowercase. For example:

```py
>>> clean(["I'll get no sleep 'til I find you (get no sleep)", "We ain't no legend, ain't no cause"])
['ill get no sleep til i find you get no sleep', 'we aint no legend aint no cause']
```

---

### 8.1.2. EX.3 b) (1 point)

Write a function `split` which expects a list filled with strings. This function returns a list with separated words from each line of lyrics. For example:

```py
>>> split(['ill get no sleep til i find you get no sleep', 'we aint no legend aint no cause'])
['ill', 'get', 'no', 'sleep', 'til', 'i', 'find', 'you', 'get', 'no', 'sleep', 'we', 'aint', 'no', 'legend', 'aint', 'no', 'cause']
```

---

### 8.1.3. EX.3 c) (1 point)

Write a function `get_unique` that expects a list filled with strings. This function returns a list without duplicates. For example:

```py
>>> get_unique(['ill', 'get', 'no', 'sleep', 'til', 'i', 'find', 'you', 'get', 'no', 'sleep', 'we', 'aint', 'no', 'legend', 'aint', 'no', 'cause'])
['cause', 'ill', 'find', 'get', 'legend', 'no', 'we', 'aint', 'til', 'you', 'i', 'sleep']
```

---

### 8.1.4. EX.3 d) (1 point)

Write a function `process_lyrics` that expects a list filled with strings. This function returns a number of unique words in the given list. This function should use all three functions that you have defined so far.

To evaluate how it works, use these lines of code to read the test lyrics:

```python

with open('path_to_the_directory/the_rolling_stones.txt') as file:
    the_rolling_stone = file.readlines()

with open('path_to_the_directory/ac_dc.txt') as file:
    ac_dc = file.readlines()
```

Of course, you should change the `path_to_the_directory` to wherever you keep those text files. We will use different lyrics to check the functionality of your code. After executing the following lines, you should see:

```py
>>> process_lyrics(the_rolling_stone)
51
>>> process_lyrics(ac_dc)
82
```

You know now, which of these bands has a bigger dictionary of words. At lest comparing these particular songs.

Please create one script with all of these functions (each definition will be evaluated separately so you can have only a part of the implemented functions). Good luck!

---

## 8.2. EX.4 (1 point)

Write a function `frequency` that expects a `list` of anything as an argument and returns dictionary with unique elements as keys and the number of them as items. For example:

```py
>>> frequency(['dog', 'cat', 'dog', 'lizard', 'dog', 'lizard'])
{'dog': 3, 'cat': 1, 'lizard': 2}
>>> print(frequency([]))
None
```

Good luck!

---

## 8.3. EX.5 (1 point)

Define a function called `find_keys(dict_to_search, val)` which expects two arguments: dictionary and some object `val`. The aim of this function is to find keys whose value is equal to `val` and return a list with these keys. For example:

```py
number_of_albums = {
  'Queen': 15, 
  'The Beatles': 12, 
  'Pink Floyd': 15, 
  'Scorpions': 19
}
```

```py
>>> find_keys(number_of_albums, 15)
['Queen', 'Pink Floyd']
>>> find_keys(number_of_albums, 12)
['The Beatles']
>>> find_keys(number_of_albums, 5)
[]
```

Good luck!

---

## 8.4. EX. 7 (1 point)

Define a function called **pangram**, which returns true if a phrase is a pangram and false when it's not. A [pangram](https://en.wikipedia.org/wiki/Pangram) is a sentence which consists of all the letters from the alphabet of a particular language. For example, English pangrams:

- sphinx of black quartz; judge my vow!,
- the quick brown fox jumps over the lazy dog.

So our function should work like that:

```py
>>> pangram('sphinx of black quartz; judge my vow!')
True
>>> pangram('the quick brown fox jumps over the lazy dog')
True
>>> pangram('is this a pangram?')
False
```

A string with all letters from the English alphabet may be handy: `'abcdefghijklmnopqrstuvwxyz'`. Don't use any loops for this task, only set methods are allowed. Good luck!
