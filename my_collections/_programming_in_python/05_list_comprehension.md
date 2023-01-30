---
title: "Lists comprehension"
excerpt: "Efficient one-line loops"
toc: true
toc_sticky: true
---

---
---

# 1. Scripts

<a href="https://github.com/lazarskiopencourses/lazarskiopencourses.github.io/tree/master/courses/programming_in_python/05_list_comprehension/scripts/">List comprehension scripts</a>

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

# 3. What is that?

List comprehension is one of the most distinctive features of Python programming language. This powerful tool allows the creation of complex functionality within a single line of code. Being able to use and understand list comprehension will be a great step forward in your programming adventure! 

You are already familiar with using `lists` in a `for` loop. Have a look at the example below, where we find squares of the first ten natural numbers:

```python
squares = []
for i in range(10):
    squares.append(i**2)
```
Printing out `squares` after the loop is finished will give the following result:

    [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

Ok, so how can we use list comprehension to shorten this code? Well, it turns out that we can get exactly the same result by running the following code:

```python
squares_lc = [i**2 for i in range(10)]
```

You can check that the result is identical. You may see that we have somewhat combined the list definition with the `for` loop. All the magic is hidden in the construction of a list comprehension:

    new_list = [expression for element in iterable]

In the elementary stage, there are three main elements of the list comprehension syntax:
1. `expression` - in the expression above it was `i**2`. This might be an element itself, a call to a method or any other valid expression that returns a value.
2. `element` - in our example, this was `i`. In general, this is an object from the list.
3. `iterable` - in our example this was `range(10)`. This has to be an object that can return its elements one at a time (list, set, sequence, generator, etc.). Basically, an object that we can _iterate over_ - thus the name _iterable_.

In the place where the `expression` is defined, we can use a function. For instance:

    >>> names = ['mateusz', 'peter', 'john']
    >>> names_length = [len(name) for name in names]
    >>> names_length
    [7, 5, 4]

It can even be a function defined by us. The only requirement is that this function must be defined before using it in the list comprehension. In other chapters, we have defined an `exchange_rate` function. Let us try to use it inside list comprehension.

```python
def exchange_rate(amount, rate=4.75, spread=0.05):
    return round((amount / rate) * ( 1 - spread),2)

list_in_PLN = [1000, 520, 326, 14568, 235]
list_in_EUR = [exchange_rate(amount) for amount in list_in_PLN]

print(list_in_EUR)
```
The output of this script should be:

    [200.0, 104.0, 65.2, 2913.6, 47.0]

You can already see how powerful list comprehension is. Defining and filling up a list in only one line of code is very convenient and easy to understand. But that's not all! In the next sections, we will show you even more interesting things you can achieve with a list comprehension. But before you proceed, make sure that you understand the basic syntax of list comprehension! You can for instance check if you can create a list with cubes of the first ten natural numbers.

---
---
# 4. Conditionals in List Comprehension
## 4.1. Selecting a subset of elements
What if we want to generate a list of squares but only for even numbers? We can easily do it using list comprehension. We just have to tell Python what condition the elements should satisfy:

    >>> [i**2 for i in range(10) if i%2==0]
    [0, 4, 16, 36, 64]
    
As you can see the syntax is quite simple:

    new_list = [expression for member in iterable (if conditional)]

The `if conditional` part is optional - that is why we have written this part in brackets.

---

## 4.2. Applying different expressions to different subsets
Another possible scenario is that we want to apply a different expression to different subsets of elements. For example, let's say we want to generate a list with even numbers squared and odd numbers cubed. We can do it like this:

    >>> [i**2 if i%2==0 else i**3 for i in range(10)]
    [0, 1, 4, 27, 16, 125, 36, 343, 64, 729]
    
As you can see we had to place the `if` statement in the expression part this time. Note that we first write the default expression and then the `if` and `else` statements - this is slightly different than when we are using the `if` and `else` statements outside the list comprehension structure:

```python 
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
squares_and_cubes = []
for number in numbers:
    if number%2 ==0:
        squares_and_cubes.append(number**2)
    else:
        squares_and_cubes.append(number**3)
print(squares_and_cubes)
```

Note how many lines of code the non-list comprehension approach needs to perform the same task!

What if we have more than 2 subsets? For e. g. what if we want to compute squares for even numbers, cubes for the odd ones which are divisible by 3 and leave the rest unchanged? Sadly, you cannot use `elifs` inside list comprehension:

    >>> [i**2 if i%2==0 elif i%3 == 0 i**3 else i for i in range(10)]
      File "<stdin>", line 1
        [i**2 if i%2==0 elif i%3 == 0 i**3 else i for i in range(10)]
                    ^
    SyntaxError: invalid syntax

What you have to do instead is to use nested `if` and `else` statements:

    >>> [i**2 if i%2==0 else i**3 if i%3==0 else i for i in range(10)]
    [0, 1, 4, 27, 16, 5, 36, 7, 64, 729]

To help you better understand what is going on here we provide you with the code which accomplishes the same task in exactly the same way, but is written without list comprehension:

```python 
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
squares_and_cubes = []
for number in numbers:
    if number%2 ==0:
        squares_and_cubes.append(number**2)
    else:
        if number%3==0:
            squares_and_cubes.append(number**3)
        else:
            squares_and_cubes.append(number)
print(squares_and_cubes)
```

Make sure you understand why these two approaches generate the same result. Note that even when we are using nested `if` and `else` statements inside list comprehension the order of the `if` statement part is still reversed compared to the non-list comprehension style, i.e. in list comprehension we first write the default expression and only then it is followed by the `if condition else something` part.

---
---
# 5. Nested Comprehensions
Ok, hopefully, you have already realized how powerful the list comprehension feature is. But we still have not covered everything you can do with it! You are already familiar with the idea of nesting various structures in Python. For instance, you should already know how you can nest an `if` and `else` statements inside another `if` and `else` statements or how to nest a `for` loop inside another `for` loop. It turns out we can apply the same philosophy to the list comprehension structure.

Imagine you want to create a list of lists. For instance, imagine you have ten clients. You would like to offer them the possibility to acquire some number of products with a discount. But you do not want the number of products to be the same for all of them. you decided that if a person was your client for `n` years they should get `n` "discount spots" in their shopping cart. So, for instance, if a person has been your client for 4 years they will get 4 "discount spots". Let's assume you have a list of the years your customers have been active in your shop. We could generate a list of lists with "discount spots" like this:

```python
customer_years = [1, 1, 2, 1, 4, 3, 2, 2]
def generate_discount_spots(n):
    return [i for i in range(n)]

discount_spots = [generate_discount_spots(years) for years in customer_years]
print(discount_spots)
```

After executing this script we should see the following output:

    [[0], [0], [0, 1], [0], [0, 1, 2, 3], [0, 1, 2], [0, 1], [0, 1]]

As you can see we have:

- a list with one spot for the 1-year customers: `[0]`
- a list with two spots for the 2-year customers: `[0, 1]`
- a list with three spots for the 3-year customers: `[0, 1, 2]`
- a list with four spots for the 4-year customers: `[0, 1, 2, 3]`

If you are surprised by the zeros you should do a recap of how Python uses indices (they start from zero) and how the `range` function works.

Ok, this was cool, but if you look closely what we are doing is using a list comprehension inside another list comprehension. We just have hidden it inside the function call - inside the `generate_sicount_spots` body. It turns out that in this scenario - the need to generate a list of lists is so common that we do not have to do it in steps like this. We can simply write the list comprehension inside the other list comprehension:

    >>> customer_years = [1, 1, 2, 1, 4, 3, 2, 2]
    >>> discount_spots = [[i for i in range(years)] for years in customer_years]
    >>> discount_spots
    [[0], [0], [0, 1], [0], [0, 1, 2, 3], [0, 1, 2], [0, 1], [0, 1]]

As you can see this version is so concise that we can easily execute this code in the inline mode one line at a time! 

---

## 5.1. Conditional statements

You may wonder if you can use conditional logic in the nested List comprehension, the answer is 'YES, you can!'. You can use it in both already described ways: at the end of the List comprehension syntax(`condition_at_the_end`) and after `expression` (`condition_after_expr`). Please read the carefully provided examples and test them on your own.

```python
condition_at_the_end = [[i**2 for z in range(6)] for i in range(5) if i % 2 == 1 ]
condition_after_expr = [[i**2 for z in range(6)] if i % 2 == 1 else i for i in range(5)]
```

In both scenarios the main loop has a `rang(5)` and the nested list is just creating a square power of provided numbers in `range(6)`. The same conditions were used but in different places of List comprehension. The output of `condition_at_the_end` is as follows:

    [[1, 1, 1, 1, 1, 1], [9, 9, 9, 9, 9, 9]] 

The output list has only 2 elements, and each of these elements is a list with 6 elements which are the following square powers of `1` for the 1st element and `3` for the 2nd element of the main loop. This is because we have used conditional logic to filter out only odd numbers (condition `i % 2 == 1` ). In the case of `condition_after_expr`, we have used the same condition, but now only for the odd numbers, the nested list performs its work. So the output is like this:

    [0, [1, 1, 1, 1, 1, 1], 2, [9, 9, 9, 9, 9, 9], 4]

---
---

# 6. Dictionary Comprehensions

Dictionary comprehension is almost the same as a list comprehension. Of course, you have to obey all the rules for dictionaries - e.g. keys in a dictionary have to be unique. Let's see how we would generate a simple dictionary using dictionary comprehension. Let's go back to our first ten natural numbers squared example. When dealing with dictionaries we have to specify keys and values. So let's say we want to create a dictionary with the first ten natural numbers as keys and their squares as values. We can do it like this:

    >>> squares_dict = {i:i**2 for i in range(10)}
    >>> squares_dict
    {0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81}

As you can see only a few things changed. First of all, we are now using curly brackets instead of square ones - quite a natural change considering we are dealing with dictionaries now. The second thing is the `:` part. We specify:

- what will be the keys - the expression on the left of the colon: `i`
- what will be the values - the expression on the right-hand side of the colon: `i**2`

---

## 6.1. Building a New Dictionary Based on Another Dictionary
If you want to create a new dictionary which will be a modified version of an existing dictionary, you can easily do it with dictionary comprehension. You just have to remember that for each dictionary there exists an `items` method which generates an iterable with `(key, value)` pairs: 

    >>> my_numbers = {'1st':2, '2nd':3, '3th':4, '4th':6, '5th':9}
    >>> my_numbers.items()
    dict_items([('1st', 2), ('2nd', 3), ('3th', 4), ('4th', 6), ('5th', 9)])
    
Let us now create a second dictionary `my_numbers` squared, i.e. we want to have the same keys, but the values should be squared. We can easily do it with dictionary comprehension:

    >>> my_numbers_squared = {key:value**2 for (key, value) in items}
    >>> my_numbers_squared
    {'1st': 4, '2nd': 9, '3th': 16, '4th': 36, '5th': 81}
    
If for some reason we also want to change the keys in our output we can wisely do it. We can for instance switch the keys and the values (note that we can do it here only because our values are unique!):

    >>> keys_values_switched = {value:key for (key, value) in my_numbers_squared.items()}
    >>> keys_values_switched
    {4: '1st', 9: '2nd', 16: '3th', 36: '4th', 81: '5th'}

---
---
# 7. Summary
A good summary of this chapter is a quote from realpython.com:

> List comprehensions are useful and can help you write elegant code that’s easy to read and debug, but they’re not the right choice for all circumstances. They might make your code run more slowly or use more memory. If your code is less performant or harder to understand, then it’s probably better to choose an alternative.
by [When to Use a List Comprehension in Python](https://realpython.com/list-comprehension-python/)

An important thing mentioned here is the efficiency of your code. You do not have to worry about this now too much - the programs you write are still rather simple and any machine should manage to accomplish your tasks no matter if you are using list comprehension or not. However, when you are dealing with very big problems, you might find that the list comprehension style takes more time to execute or uses more memory. In a situation like this deep analysis of different approaches is needed to choose the one which is the most efficient.

---
---

# 8. Exercises

In the all following examples you are not allowed to use for or while loop. It is a time to train your list comprehension skills.

---

## 8.1. EX. 1 (2 points)

Write a function `letters_filter` that expects a string and returns filtered-out vowels and consonants from a given string. This function should return a dictionary with two separate lists: 1st with vowels (key: vowels) and 2nd with consonants (key: consonants). Strings will be written in lowercase only. Examples:

```py
>>> letters_filter('challenge nr 127 accepted')
{'vowels': ['a', 'e', 'e', 'a', 'e', 'e'], 'consonants': ['c', 'h', 'l', 'l', 'n', 'g', 'n', 'r', 'c', 'c', 'p', 't', 'd']}
>>> letters_filter('aouie')              
{'vowels': ['a', 'o', 'u', 'i', 'e'], 'consonants': []}
>>> letters_filter('qwrtypsdfghjklzxcvbnm')   
{'vowels': [], 'consonants': ['q', 'w', 'r', 't', 'y', 'p', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm']}
>>> letters_filter('')                      
{'vowels': [], 'consonants': []}
```

A list of vowels may be helpful: `'aouie'`. 

Good luck!

---

## 8.2. EX. 2 (2 points) 

Write a function `multip_table` which expects an `int` as an argument and returns a list of lists. Your task is to return a multiplication table representing all numbers from `1` up to the given `int` value. Examples:

```py
>>> multip_table(0)
[]
>>> multip_table(1)
[[1]]
>>> multip_table(3) 
[[1,2,3],
 [2,4,6],
 [3,6,9]]
>>> multip_table(9)  
[[1, 2, 3, 4, 5, 6, 7, 8, 9], 
 [2, 4, 6, 8, 10, 12, 14, 16, 18], 
 [3, 6, 9, 12, 15, 18, 21, 24, 27], 
 [4, 8, 12, 16, 20, 24, 28, 32, 36], 
 [5, 10, 15, 20, 25, 30, 35, 40, 45], 
 [6, 12, 18, 24, 30, 36, 42, 48, 54], 
 [7, 14, 21, 28, 35, 42, 49, 56, 63], 
 [8, 16, 24, 32, 40, 48, 56, 64, 72], 
 [9, 18, 27, 36, 45, 54, 63, 72, 81]]
```

Good luck!

---

## 8.3. EX. 3 (2 points)

Write a function called **sum_up**, which expects an arbitrary number of lists or tuples as an argument and returns an index-wise sum of the numbers. We assume that all lists (tuples) have the same number of elements. Examples:

```py
>>> sum_up([1,2,3], [2,3,4], [3,4,5])
[6, 9, 12] # [1+2+3, 2+3+4, 3+4+5]
>>> sum_up((-5, 3, 0, 12), (2, 9, 1, -4))
[-3, 12, 1, 8] # [-5+2, 3+9, 0+1, 12-4]
sum_up([1,2,3])
[1,2,3]
```

Good luck!

---

## 8.4. EX. 4 (4 points)

Define a function named **subsets**, which returns all the subsets of a given list (or tuples or sets, it shouldn't matter) of numbers. Examples:

```py
>>> subsets([4,8])
[[], [4], [8], [4, 8]]
>>> subsets([1,2,3])
[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
subsets([4])
[[], [4]]
subsets([6,1,0,-1,2,8])
[[], [6], [1], [6, 1], [0], [6, 0], [1, 0], [6, 1, 0], [-1], [6, -1], [1, -1], [6, 1, -1], [0, -1], [6, 0, -1], [1, 0, -1], [6, 1, 0, -1], [2], [6, 2], [1, 2], [6, 1, 2], [0, 2], [6, 0, 2], [1, 0, 2], [6, 1, 0, 2], [-1, 2], [6, -1, 2], [1, -1, 2], [6, 1, -1, 2], [0, -1, 2], [6, 0, -1, 2], [1, 0, -1, 2], [6, 1, 0, -1, 2], [8], [6, 8], [1, 8], [6, 1, 8], [0, 8], [6, 0, 8], [1, 0, 8], [6, 1, 0, 8], [-1, 8], [6, -1, 8], [1, -1, 8], [6, 1, -1, 8], [0, -1, 8], [6, 0, -1, 8], [1, 0, -1, 8], [6, 1, 0, -1, 8], [2, 8], [6, 2, 8], [1, 2, 8], [6, 1, 2, 8], [0, 2, 8], [6, 0, 2, 8], [1, 0, 2, 8], [6, 1, 0, 2, 8], [-1, 2, 8], [6, -1, 2, 8], [1, -1, 2, 8], [6, 1, -1, 2, 8], [0, -1, 2, 8], [6, 0, -1, 2, 8], [1, 0, -1, 2, 8], [6, 1, 0, -1, 2, 8]]
```

Good luck!