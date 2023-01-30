---
title: "Structural pattern matching"
excerpt: "A way to match objects by pattern"
toc: true
toc_sticky: true
---

---
---

# 1. Scripts

<a href="https://github.com/lazarskiopencourses/lazarskiopencourses.github.io/tree/master/courses/programming_in_python/06_pattern_matching/scripts/">Pattern matching scripts</a>

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

# 3. Requirements
## 3.1. Python >= 3.10

To be able to use structural pattern matching you have to work with `Python 3.10` or higher. Please check what version of Python are you currently using: 

    python3 --version #while working on Linux

or 

    python --version # depend if there is python 2 on your computer. 

The same syntax is needed while working on Windows. In the case of macOS please use `-` instead of `--`. In case of using Google Colab:

    !python3 --version
    
If your `Python` version is lower than 3.10 try to update your `Python` version or follow the installation procedure provided under this [link](https://www.python.org/downloads/). 

Make sure that your `Python` version is appropriate. In another way, you won't be able to perform any structural pattern matching. 

---
---

# 4. Structural Pattern Matching - into

## 4.1. Python version of switch/case syntax

>A switch statement is significantly faster than an if-else ladder if there are many nested if-else involved. This is due to the creation of a jump table for switches during compilation. As a result, instead of checking which case is satisfied throughout execution, it just decides which case must be completed. The number of comparisons made is lesser hence, reducing the compile time. Hence, while selecting from a large set of values, the switch would work better. Based on [this article](https://www.scaler.com/topics/c/difference-between-if-else-and-switch/).

What is more a typical `if - else` statement is used to choose between two options, one may use many `elif` statements to extend the number of possible options but this significantly reduces the speed of this logical condition. Using switch/case (from now we will refer to `match/case`) allows for numerous options, from the very beginning. `match/case` is easy to modify, and there might be no logical connection between options, which is a great advantage over `if-else` statement. Using `match/case` allows for replacing multiple `if-else` statements needed to use in some cases. But what is this `match/case`?

---

## 4.2. `match/case`

Is a statement which compares the condition value with multiple cases. Matches are performed by going through the list of cases from top to bottom. When the match is found Python executes the statement in the corresponding case block, and then skips the remaining cases. A match statement typically has more than one/two `cases`. The syntax looks like this:

```python
match command:
    case <pattern_1>:

        <action_1>

    case <pattern_2>:
        
        <action_2>
    ...
    ...
    ...
    case _:

        <action_wildcard>
```

Important notes:
* there is no: `return`, `break`, `stop` , etc. keyword at the end of `match`;
* ` _ ` (underscore) - is a wildcard, which matches anything. This is why it is the last case of the whole statement. 
* `match` & `case` are soft keywords. There won't be a syntax error after using these words as variables in the code. 
* Pattern checks are made with equality checking `pattern == command`.
> The match statement is not a function, nor does it return anything. It simply demarcates the beginning of one or more case clauses, like a daisy chain of if statements. 
Based on [link](https://www.inspiredpython.com/course/pattern-matching/mastering-structural-pattern-matching#the-match-statement)


---
---

# 5. Simple examples

Let us see how we can use `match/case` for finding the number of days of each month. So far we would probably do it like this:

```python
months = ['January', 'February', 'March', "April", 'May', 'Jun', 'July', 'August', 'September', 'October', 'November', 'December']
month_dict ={months[i]: i+1 for i in range(len(months))}
def how_many_days(month_name):
    if month_name in months:    
        month_number = month_dict[month_name]
        if month_number in [1,3,5,7,8,9,12]:
            number_of_days = '31'
        elif month_number in [4, 6, 10, 11]:
            number_of_days = '30'
        else:
            number_of_days = '28 or 29'
    else:
        number_of_days = 'There is no such a month'
    return number_of_days
```

So the `how_many_days` returns the number of days for provided month name. In the case of the `match/case` approach:

```python
def how_many_days_match(month_name):
    if month_name in months:    
        month_number = month_dict[month_name]
        match month_number:
            case 1 | 3 | 5 | 7 | 8 | 9 | 12:
                number_of_days = '31'
            case 4 | 6 | 10 | 11:
                number_of_days = '30'
            case _:
                number_of_days = '28 or 29'
    else:
        number_of_days = 'There is no such a month'
    return number_of_days
```

Please compare by yourself these 2 codes. In the second example ` | ` stands for 'or', so `case 1 | 3 | 5 | 7 | 8 | 9 | 12` is equivalent to if `month_number in [1,3,5,7,8,9,12]`.
In this particular example, there is almost no difference in using `match/case` instead of `if - else`. However, this example should give you a taste of using `match/case` and the whole logic hidden behind it. 

---
---

# 6. More sophisticated example

From this place, we will focus on `match/case` mostly. Let us go through some examples line by line:

---

## 6.1. Example 1

A program that asks a user to provide some string, based on which some action takes place:

```python
command = input()
match command.split():
    case ["exit"]:
        exit()
    case ["open", filename]:
        open(filename)
    case ["close", filename]:
        close(filename)
    case _:
        print (f"No such '{command}' a command")

```

1. `command = input()` program asks a user to provide some text, which would be assigned to the `command` variable;
2. `match command.split():` we create a `match/case`. Here we use ` . ` to use a `split()` function as well as to match against the contents of the `command` variable. 
3. `case ["exit"]:` Python checks if the first element of `command.split()` matches with `"exit"` if yes then Python performs `exit()`.
4. `case ["open", filename]:` If the previous `case` didn't match `command.split()` another `case` is tested. In this scenario Python looks for `'open'` as the first element of `command.split()`, and if it is true then the second element is taken and the `open(filename)` function is called. 
5. `case ["close", filename]:` same as for the previous one, with the exception that now Python is closing a file instead of opening. 
6. `case _:` If non of the cases above matches the `command.split()` this case is executed. 

---

## 6.2. Example 2

Based on [PEP](https://peps.python.org/pep-0636/)

```python
# point is an (x, y) tuple
match point:
    case (0, 0):
        print("Origin")
    case (0, y):
        print(f"Y={y}")
    case (x, 0):
        print(f"X={x}")
    case (x, y):
        print(f"X={x}, Y={y}")
    case _:
        raise ValueError("Not a point")
```

In this example, we are facing a cod which is printing for us 'X' and 'Y' coordinates for provided point (a tuple).

1. `case (0, 0):` If a point is located in `(0, 0)` then the program prints 'Origin'.
2. `case (0, y):` This case is matched if the first element of the tuple is `0` and the second might be any. 
3. `case (x, 0):` In this case, the second element must be `0` and the first might be any. 
4. `case (x, y):` For this scenario `(x,y)` might be any numbers.
5. `case _:` awaits for any `point` value which does not match any of these above. 

Please take some time and test this example. Check what would happen if you change the order of provided cases. How the logic of this `match/case` example works? Can we move the 4th `case` into 1st or 2nd place, what do you expect after this change? 

---
---

# 7. Pattern matching

As a pattern, we may use simple values or complex ones with matching logic. Structural pattern matching allows for matching against objects with specific values. Now we will discuss the most common examples of patterns. We have already used some of them. 

* Matching against a single value `'value'`
    case 'value':
* Matching against the collection `['value', 'value_2']`
    case ['value', 'value_2']:
* Matching against either `'value','value_2' or 'value_3'`
    case ('value' | 'value_2' | 'value_3'):
* Matching against any collection of items, which starts with `'a'`
    case ["a", _]:
* Matching against the collection `['value', value]`, where `value` captures the second value of the collection
    case ['value', value]:
* Matching against the collection `['value', *values]`, which collects at least one value. `*values` captures each subsequent value.
    case ['value', *values]:

---
---

# 8. Guards

Guards are not patterns. They start to work after the patterns are matched, but before the code inside the `case` is executed. So the syntax of `match/case` looks like this:

```python 
match command:
    case <pattern_1> if guard:

        <action_1>

    case <pattern_2> if guard:
        
        <action_2>
    ...
    ...
    ...
    case _:

        <action_wildcard>
```

This can be used in the following example of checking the matched pattern.

```py
def age_check(age):
    match age:
        case 0:
            return "You are starting to exist. Welcome!"
        case int() if age > 0:
            return f"You are now {age} years old. If you don't die, in five years you will be {age + 5} years old."
        case int():
            return f'You will be born in {-age} years.'
        case float() if age > 0:
            return f'You are a very precise person. Now you are {age} years old.'
        case float():
            return f'You will be born in {-age} float years.'
        case _:
            return 'Your age was not provided correctly'
```

The `age_check` function expects int or float as an argument, and depending on provided `age` returns a different output. Our guards simply check if `age` is positive and based on that distinguish what is returned. Examples:

```py
>>> age_check(0)
'You are starting to exist. Welcome!'
>>> age_check(20)
"You are now 20 years old. If you don't die, in five years you will be 25 years old."
>>> age_check(-15)
'You will be born in 15 years.'
>>> age_check(50.6)
'You are a very precise person. Now you are 50.6 years old.'
>>> age_check(-5.1)
'You will be born in 5.1 float years.'
>>> age_check('100')
'Your age was not provided correctly'
```

You can try to rewrite this example using only the `if-else-elif` structure. Function `isinstance` may be handy.

You may find some additional knowledge and examples under these links [1](https://www.infoworld.com/article/3609208/how-to-use-structural-pattern-matching-in-python.html), [2](https://peps.python.org/pep-0636/), [3](https://python-course.eu/python-tutorial/structural-pattern-matching.php)

---
---

# 9. Exercises

## 9.1. Ex. 1 (4 points)

Write an `exchange` function which expects a string. This string should contain 3 information: currency name, currency rate, and amount of currency you want to have in the from `'currency rate amount'`. This function should return one of these 3 sentences:

* `'You have to prepare amount_calculated PLN to get amount currency'`,
* `'currency should be a string and rate and amount should be a number'`,
* `'Something went wrong. Input must have a from currency rate amount'`.

Examples:

```py
>>> exchange('EUR 4.66 175') 
'You have to prepare 815.5 PLN to get 175 EUR'
>>> exchange('USD 4.39 24')
'You have to prepare 105.36 PLN to get 24 USD'
>>> exchange('NOK forty_five 50')
'currency should be a string and rate and amount should be a number'
>>> exchange('NOK 0.45 fifty')
'currency should be a string and rate and amount should be a number'
>>> exchange('123 0.45 50')
'currency should be a string and rate and amount should be a number'
>>> exchange('NOK 0.45')
'Something went wrong. Input must have a from currency rate amount'
>>> exchange('0.45 50')
'Something went wrong. Input must have a from currency rate amount'
>>> exchange('50')      
'Something went wrong. Input must have a from currency rate amount'
```

amount_calculated should be rounded to two decimal places. We assume that the exchange rate is in the indirect form, which means that it is information on how much PLN is needed to buy one unit of foreign currency. You are not allowed to use the `if-elif-else` structure.

Good luck!

---

## 9.2. Ex. 2 (6 points)

Write a `quadratic` function which expects a tuple with 3 elements. The function returns information about root/s and calculates its values. Consider multiple options for the parameter value. The quadratic equation looks like this 

$$ax^2 + bx + c = 0\text{,}$$ 

and argument should has the form `(a, b, c)`. Consider the following returns:

* Origin
* Linear function with no root
* Linear function with the root at ...
* Quadratic function with no real roots
* Quadratic function with one root at ...
* Quadratic function with 2 roots: ..., ...
* Improper input

Replace ... with correct values.

Examples:

```py
>>> quadratic((0, 0, 0))
'Origin'
>>> quadratic((0, 0, 6)) 
'Linear function with no root'
>>> quadratic((0, 2, 3)) 
'Linear function with the root at -1.5'
>>> quadratic((0, 2, 0)) 
'Linear function with the root at 0.0' # or just 0
>>> quadratic((3, 0, 0)) 
'Quadratic function with one root at 0.0' # or just 0
>>> quadratic((3, 0, 2)) 
'Quadratic function with no real roots'
>>> quadratic((3, 0, -2)) 
'Quadratic function with 2 roots: 0.82, -0.82'
>>> quadratic((3, 1, 1 / 12)) 
'Quadratic function with one root at -0.17'
>>> quadratic((0, 0, '0'))    
'Improper input'
>>> quadratic(('0', 0, 0))     
'Improper input'
>>> quadratic((0, '0', 0)) 
'Improper input'
>>> quadratic((0, 0))      
'Improper input'
>>> quadratic((0,))   
'Improper input'
>>> quadratic('improper_input') 
'Improper input'
```

Roots should be rounded to two decimal places and every time if at least one of the elements of the tuple is not an int or float or we don't have the needed number of points, the function should return `'Improper input'`. You are not allowed to use the `if-elif-else` structure.

Good luck!