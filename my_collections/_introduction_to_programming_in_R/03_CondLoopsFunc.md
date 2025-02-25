---
title: "Functions, loops and conditional statements"
excerpt: "Learn how to use these in R"
toc: true
toc_sticky: true
---

<script language="javascript" type="text/javascript">
var scrt_name = "/03_CondLoopsFunc"; 
</script>

---
---

# 1. Links to all scripts

## 1.1. Main script

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.R'; return false;" download target="_blank">Functions, loops and conditional statements .R</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.Rmd'; return false;" download target="_blank">Functions, loops and conditional statements .Rmd</a>

---

## 1.2. Exercises

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_1.Rmd'; return false;" download target="_blank">Exercise 1</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_2.Rmd'; return false;" download target="_blank">Exercise 2</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_3.Rmd'; return false;" download target="_blank">Exercise 3</a>

---
---

# 2. Introduction

Today, we will cover some of the fundamental building blocks of programming in R, including logical operators, conditional statements, loops, and functions.

Logical operators are used to compare values and evaluate whether a certain condition is true or false. For example, you might use a logical operator to check if a number is greater than another number, or if a string is equal to another string.

Conditional statements are used to control the flow of a program based on the result of a logical operation. For example, you might use a conditional statement to execute a certain block of code only if a certain condition is met, or to execute one block of code if a condition is met and another block of code if the condition is not met.

Loops are used to repeat a block of code multiple times, either a specific number of times or until a certain condition is met. For example, you might use a loop to iterate over the elements of a vector or to repeat a certain task until a certain result is achieved.

Functions are reusable pieces of code that perform a specific task. Functions are defined by the user and can be called by the user or by other functions. Functions take zero or more arguments as input and return a value or values as output. Functions are useful for organizing and modularizing code, and for avoiding repetition of code.

In this tutorial, we will cover each of these concepts in more detail and provide examples of how to use them in R. By the end of this tutorial, you should have a solid understanding of these basic programming concepts and be able to use them to write more effective and efficient R code. Let's get started!

---
---

# 3. Logical operators

The logical operators in R are used to combine and compare two or more conditions and perform the logical operations. For this we can use `&` (logical `AND`), `|` (logical `OR`) and `!` (logical `NOT`).

The logical operators:
* `&` (`AND`) - returns `TRUE` when both conditions are true
* `&&` (`AND`) - same as the above but it works on a single element
* `|` (`OR`) - returns `TRUE` when at least one of the conditions is true
* `||` (`OR`) - same as the above but it works on a single element
* `!` (`NOT`) - if the condition is `TRUE`, logical `NOT` operator returns `FALSE` (and the other way around)

Double `&&` compare only the first elements, resulting in a single-length logical vector. Single `&` performs element-wise operation producing results having a length of the longer operand.

```R
print(c(TRUE, TRUE) & c(FALSE, TRUE))
print(c(TRUE, TRUE) && c(TRUE, FALSE))
print(c(TRUE, TRUE) && c(FALSE, FALSE))
```

As you can see, double `&&` even warn to make sure that you know what you are doing. In general, at this point, it is safer and preferred to use only `&` and `|`.

Just as in mathematical logic, for `AND`:

| Condition1 | Condition2 | Condition1 & Condition2 |
|------------|------------|-------------------------|
| TRUE       | TRUE       | TRUE                    |
| TRUE       | FALSE      | FALSE                   |
| FALSE      | TRUE       | FALSE                   |
| FALSE      | FALSE      | FALSE                   |

and for `OR`:

| Condition1 | Condition2 | Condition1 | Condition2 |
|------------|------------|-------------------------|
| TRUE       | TRUE       | TRUE                    |
| TRUE       | FALSE      | TRUE                    |
| FALSE      | TRUE       | TRUE                    |
| FALSE      | FALSE      | FALSE                   |

---
---

# 4. Conditional statements

Conditional statements allow us to do different things depending on the current situation. For example, we could create a payment system that:
* accepts a payment only if the payment value is smaller than the funds available in a customer's account.
* declines a payment if the payment value exceeds the funds available in a customer's account.

In other words, depending on whether or not certain logical conditions are met, different operations are performed. In R, we can use the following logical conditions:

* `a == b` (`a` is equal to `b`)
* `a != b` (`a` is unequal to `b`)
* `a < b` (`a` is smaller than `b`)
* `a <= b` (`a` is smaller or equal to `b`)
* `a > b` (`a` is greater than `b`)
* `a >= b` (`a` is greater or equal to `b`)

In order to use conditional statements, we must first write the word `if`, followed by a logical condition in brackets `()`. The whole expression that we want to run only when the specified logical condition is satisfied should be inside the curly brace `{}`. Overall, it should look like this:


```R
if (logical_condition){
    run this expression if logical_condition is TRUE
}
```

The cell below demonstrates the use of a conditional statement.
```R
# Define variables
account_balance <- 100
payment_value <- 101

msg <- 'payment is accepted'

if (payment_value > account_balance){
  # If the payment value is greater than the account balance, assign the message 'payment is declined' to the msg variable
  msg <- 'payment is declined'
}
print(msg)
```

We can extend this structure by introducing the `if-else` statement.
```R
# Define variables
account_balance <- 100
payment_value <- 101

# Check if the payment value is greater than the account balance
if (payment_value > account_balance){
  # If the payment value is greater than the account balance, assign the message 'payment is declined' to the msg variable
  msg <- 'payment is declined'
} else {
  # If the payment value is not greater than the account balance, assign the message 'payment is accepted' to the msg variable
  msg <- 'payment is accepted'
}

# Print the message
print(msg)
```

In the code cell above, the `if` statement specifies a logical condition, while the `else` statement signifies a block of indented code, which will run if the logical condition specified by the previous `if` statement is not satisfied. Both the `if` statement and the `else` statement are connected and form one structure containing code that runs only if certain conditions are met. This is referred to as a `compound statement`.

There can also be multiple `if` statements, which are defined with the use of the `else if` statement. The code cell below shows a compound statement consisting of the `if`, `else if`, and `else` statements.
```R
# Assign a value to the subscription_type variable
subscription_type <- 'B'

# Check if the subscription type is 'A'
if (subscription_type == 'A'){
  # If the subscription type is 'A', assign the message to the msg variable
  msg <- 'You have purchased the monthly subscription!'

# If the subscription type is not 'A', check if it is 'B'
} else if (subscription_type == 'B'){
  # If the subscription type is 'B', assign the message to the msg variable
  msg <- 'You have purchased the yearly subscription!'

# If the subscription type is not 'A' or 'B', check if it is 'C'
} else if (subscription_type == 'C'){
  # If the subscription type is 'C', assign the message to the msg variable
  msg <- 'You have purchased the unlimited subscription!'

# If the subscription type is none of 'A', 'B', or 'C'
} else {
  # Assign the message to the msg variable
  msg <- 'Invalid subscription type'
}

# Print the message
print(msg)
```

In the code cell above, R checks the conditional statements one by one. If the logical condition in one of the statements is satisfied, R will execute the indented code belonging to that statement. However, after the code belonging to that statement is executed, R skips the remaining conditional statements. Only one block of code is executed per the entire compound statement consisting of `if`, `else if`, and `else` keywords.

Therefore, R first checks the logical condition `subscription_type == 'A'`. Since this logical condition is not satisfied, it proceeds to the next conditional statement. The next statement contains the logical condition `subscription_type == 'B'`. This logical condition is satisfied and therefore the indented code below is executed, which assigns a certain value to the variable `msg`. Since one of the logical conditions has been satisfied, R does not check the remaining conditional statements. Therefore, even if the logical conditions specified in the remaining statements were satisfied, the indented code belonging to those statements would not run. We can see this in the following example:
```R
x <- 1

if (x == 1){
  msg <- 'first'
} else if (x == 1){
  msg <- 'second'
}
print(msg)    
```

In the code cell above, the logical conditions in both statements are the same. However, we can see that the variable `msg` holds the value `'first'`. Since the logical condition in the first statement is satisfied, the second conditional statement is not checked by R, and the code belonging to that statement is not executed either.

Note that when we write compound conditional statements, the first statement is always an `if` statement. Then we can optionally choose to add more specific logical conditions with an `else if` statement or we can optionally add an `else` statement. Both `else if` and `else` are optional, however, the order must always be preserved. This means that if you use both `else if` and `else`, then the `else` statement must always be last.

---
---

# 5. Loops

Loops are a type of control structure in the R programming language that allow you to repeat a specific block of code a certain number of times. There are two types of loops in R: `for` loops and `while` loops.

---

## 5.1. For loop

A `for` loop is a type of loop in the R programming language that allows you to repeat a specific block of code a certain number of times. This is useful when you want to perform the same operations on multiple pieces of data, such as when you want to process each element in an array or data frame.

To use a `for` loop in R, you need to provide a vector of values that the loop will use to iterate. The vector can be a list of numbers, letters, or even a combination of both. Here's an example of a `for` loop that iterates over the numbers 1 through 10:
```R
# Create a vector of numbers from 1 to 10
nums <- 1:10

# Use a for loop to iterate over the vector of numbers
for (i in nums) {
  # Inside the for loop, print the current value of i
  print(i)
}  
```

This block of code prints the numbers `1` through `10` to the console, with each number on a separate line.

You can also use a `for` loop to iterate over a vector of letters, like this:
```R
# Create a vector of letters
letters <- c('L', 'a', 'z', 'a', 'r', 's', 'k', 'i')

# Use a for loop to iterate over the vector of letters
for (i in letters) {
  # Inside the for loop, print the current value of i
  print(i)
}
```

You can use a `for` loop to perform any operation that you want to repeat a specific number of times.

---

## 5.2. While loop

A `while` loop is a type of loop in the R programming language that allows you to repeat a specific block of code as long as a certain condition is met. This is useful when you want to perform an operation repeatedly until a specific condition is reached, such as when you want to keep processing data until all elements in a vector have been processed.

To use a `while` loop in R, you need to provide a logical condition that determines when the loop should stop running. This condition is checked at the beginning of each iteration of the loop, and if it evaluates to `TRUE`, the loop continues to run. If the condition evaluates to `FALSE`, the loop stops and control is passed to the next statement after the loop.

Here's an example of a `while` loop that continues to run as long as the value of the variable `x` is less than `10`:
```R
# Set the initial value of x to 0
x <- 0

# Use a while loop to repeat the following code as long as x is less than 10
while (x < 10) {
  # Inside the while loop, increment the value of x by 1
  x <- x + 1
  
  # Print the current value of x
  print(x)
}
```

This block of code printed the numbers `1` through `10` to the console, with each number on a separate line.

You can also use a `while` loop to perform operations on a vector of data. For example, if you have a vector called `values` and you want to calculate the sum of all elements in the vector, you could use a `while` loop like this:
```R
# Define values vector
values <- c(2, 6, 13)

# Set the initial value of the sum to 0
sum <- 0

# Set the initial value of the index to 1
index <- 1

# Use a while loop to repeat the following code as long as the index is less than or equal to the length of the vector
while (index <= length(values)) {
  # Inside the while loop, add the current element of the vector to the sum
  sum <- sum + values[index]
  
  # Increment the index by 1
  index <- index + 1
}

# After the while loop has finished running, print the final value of the sum
print(sum)
```

This code will calculate the sum of all elements in the `values` vector and print the result to the console.

In summary, `while` loops in R are a useful way to repeat a specific operation as long as a certain condition is met. They can be used to perform operations on individual elements in a vector or array, and are particularly useful when you don't know in advance how many iterations of the loop will be needed. By using a `while` loop, you can repeat an operation until a specific condition is reached, making them a powerful tool in your R programming toolkit.

---

## 5.3. When to use a loop?

In general, loops are used to automate repetitive tasks, making them a useful tool for simplifying and speeding up your R code. They are particularly useful when working with large datasets, as they can help you avoid writing lengthy and complex code that performs the same operation multiple times. By using loops, you can write concise and efficient code that can handle a wide range of data and scenarios.

However, loops can sometimes be overused. In many cases, equivalent tasks can be performed more efficiently using functions instead of loops. However, there are situations where loops are the best or only option for achieving a desired result. In general, loops can be inefficient in R, particularly when working with large datasets, and should be avoided when better alternatives exist.

---
---

# 6. Functions

A function is a block of reusable code in the R programming language that performs a specific task. Functions are an essential part of any programming language, as they allow you to modularize your code and make it more organized, readable, and maintainable.

---

## 6.1. One argument

To create a function in R, you use the function keyword followed by the name of the function and a set of parentheses that contain the function's arguments. The body of the function contains the code that the function will execute when it is called.
```R
# Define a function called "square" that takes one argument, "x"
square <- function(x) {
  # Inside the function, return the square of x
  return(x * x) # or x^2
}
```

To call this function, you would provide the value for the `x` argument in the parentheses after the function name:
```R
# Call the "square" function, passing in the value 4 as the argument
square(4)
```

This code will return the value `16`, which is the square of the number that was passed to the function.

---

## 6.2. Multiple arguments

To create a function in R with more than one argument, you simply need to specify multiple arguments in the function definition, separated by commas. Here's an example of a function that calculates the sum of two numbers:
```R
# Define a function called "add" that takes two arguments, "x" and "y"
add <- function(x, y) {
  # Inside the function, return the sum of x and y
  return(x + y)
}
```

In this example, the `add` function takes two arguments: `x` and `y`. These arguments are specified after the function name in the function definition, separated by a comma. When the function is called, the values for these arguments will be provided by the caller and will be used in the code inside the function to calculate the sum of the two numbers.

To call this function, you should provide the values for the `x` and `y` arguments in the parentheses after the function name, in the same order as they appear in the function definition. Here's an example of how you could call the `add` function:
```R
# Call the "add" function, passing in the values 2 and 3 as arguments
add(2, 3)
```

This code will return the value `5`, which is the sum of the two numbers that were passed to the function as arguments.

You can also specify default values for arguments in a function. Here's an example of a function that calculates the square of a number, with an optional argument `op` that specifies the type of operation to perform:
```R
# Define a function called "calc" that takes one required argument, "x", and one optional argument, "op"
calc <- function(x, op = "^2") {
  # Inside the function, check the value of the "op" argument
  if (op == "^2") {
    # If the "op" argument is "^2", return the square of x
    return(x^2)
  } else if (op == "^3") {
    # If the "op" argument is "^3", return the cube of x
    return(x^3)
  } else if (op == "^4") {
    # If the "op" argument is "^4", return the fourth power of x
    return(x^4)
  }
}
```

To call this function and use the default value for the `op` argument, you can simply provide the value for the `x` argument:
```R
# Call the "calc" function, passing in the value 4 as the argument
calc(4)
```

This code will return the value `16`, which is the square of the number that was passed to the function.

To call this function and specify a value for the `op` argument, you can provide the value for the `op` argument in the same order as it appears in the function definition:
```R
# Call the "calc" function, passing in the value 4 as the argument, and the value "^3" as the optional argument
calc(4, "^3")
```

This code will return the value `64`, which is the cube of the number that was passed to the function.

Let's consider another example:
Let's say you are a data scientist who is working on a project to analyze the performance of a machine learning model. One of the tasks you need to perform is to calculate the root mean squared error (RMSE) of the model's predictions.

To do this, you could create a function called `rmse` that takes a vector of predicted values and a vector of actual values as arguments and returns the RMSE. Here's an example of how you could define this function:
```R
# Define a function called "rmse" that takes two vectors called "predicted" and "actual" as arguments
rmse <- function(predicted, actual) {
  # Inside the function, calculate the RMSE using the "sqrt" and "mean" functions
  error <- sqrt(mean((predicted - actual)^2))
  
  # Return the resulting value
  return(error)
}
```

To call this function, you have to provide the vectors of predicted and actual values as arguments:
```R
# Define a vector of predicted values
predictions <- c(1.5, 2.3, 3.1, 4.6, 5.4)

# Define a vector of actual values
actuals <- c(1.2, 2.1, 3.3, 4.5, 5.5)

# Call the "rmse" function, passing in the vectors "predictions" and "actuals" as arguments
rmse(predictions, actuals)
```

The resulting value is the square root of the mean of the squared differences between the predicted and actual values.

To create a function in R with more than one argument, you simply need to specify multiple arguments in the function definition, separated by commas. Here's an example of a function that calculates the sum of two numbers:
```R
# Define a function called "add" that takes two arguments, "x" and "y"
add <- function(x, y) {
  # Inside the function, return the sum of x and y
  return(x + y)
}
```

In this example, the `add` function takes two arguments: `x` and `y`. These arguments are specified after the function name in the function definition, separated by a comma. When the function is called, the values for these arguments will be provided by the caller and will be used in the code inside the function to calculate the sum of the two numbers.

To call this function, you should provide the values for the `x` and `y` arguments in the parentheses after the function name, in the same order as they appear in the function definition. Here's an example of how you could call the `add` function:
```R
# Call the "add" function, passing in the values 2 and 3 as arguments
add(2, 3)
```

This code will return the value 5, which is the sum of the two numbers that were passed to the function as arguments.

You can also create functions with more than two arguments.


To sum up, a function is like a recipe for a specific task. Just like a recipe tells you what ingredients to use and how to combine them to make a dish, a function tells the computer what pieces of data to use and how to manipulate them to perform a specific task. When you want to perform the task, you can simply "call" the function, just like you would follow a recipe to make a dish. The function will take the data you provide as "arguments" and use it to perform the task, just like a recipe uses ingredients to make a dish. When the task is complete, the function will "return" a result, just like a recipe produces a finished dish.

Functions are useful because they allow you to reuse the same code multiple times without having to repeat it. This makes your code more organized and modular, and it also makes it easier to maintain and update your code in the future. Functions are a fundamental building block of programming in R, and they are essential for creating efficient and effective code.