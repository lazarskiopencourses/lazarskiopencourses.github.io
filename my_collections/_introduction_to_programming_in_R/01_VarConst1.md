---
title: "Variables and constants 1"
excerpt: "You will learn about variables and constants"
toc: true
toc_sticky: true
---

<script language="javascript" type="text/javascript">
var scrt_name = "/01_VarConst1"; 
</script>

---
---

# 1. Before the topic

## 1.1. Greeting

Welcome! In this course, you will learn the basics of programming in R. As you could have seen one page before, the course is divided into 6 modules. Each module contains the main R script, which can be download in two forms, as .Rmd file with all the content from this site as well as more raw .R file, and several exercises. The amount of work required for each script should be roughly the same. Exercises should be completed and uploaded to [Gradescope](https://www.gradescope.com/) if you are officially enrolled in the course.

---

## 1.2. Links to all scripts

### 1.2.1. Main script

In order to be able to work with these files, you have to download it and open it in RStudio. If you don't have RStudio installed and don't know how to do it, instructions from [this site](https://rstudio-education.github.io/hopr/starting.html) should help. To download a script, you have to click on the hyperlinks below. It will be saved either in your default folder with downloaded files or your browser will ask you to pick the place where it will be stored. If something is wrong with it, make sure that the file has been saved using the correct extension, which is either `.R` or `.Rmd`, depending on what you have chosen.

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.R'; return false;" download target="_blank">Variables and Constants .R</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.Rmd'; return false;" download target="_blank">Variables and Constants .Rmd</a>

---

### 1.2.2. Exercises

To solve exercises, you have to download the scripts and write your solution in the `
```{r} # YOUR CODE HERE```
` chunk. 
This time, the extension of files should be `.Rmd`.


* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_1.Rmd'; return false;" download target="_blank">Exercise 1</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_2.Rmd'; return false;" download target="_blank">Exercise 2</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_3.Rmd'; return false;" download target="_blank">Exercise 3</a>

---
---

# 2. Introduction

R is a popular programming language used for statistical computing and graphical presentation. It is widely used and valued because:
* It is a great resource for data analysis, data visualization, data science, and machine learning
* It provides many statistical techniques (such as statistical tests, classification, clustering, and data reduction)
* It is easy to draw graphs in R, like pie charts, histograms, box plots, scatter plots, etc.
* It works on different platforms (Windows, Mac, Linux)
* It is open-source and free
* It has a large community support
* It has many packages (libraries of functions) that can be used to solve different problems

---

## 2.1. Set-up R and RStudio

You can run R programs in two different ways:
* Installing R in your local machine
* Using an online environment

During these classes, we suggest the former option.

There are many online tutorials on how to install R and RStudio, you can start from: https://rstudio-education.github.io/hopr/starting.html or
https://techvidvan.com/tutorials/install-r/

---

## 2.2. Some useful keyboard shortcuts in RStudio

* CTRL+ENTER / CTRL+R: run instructions from the script (current line or marked part of code)
* CTRL+L: clear console
* CTRL+arrow up: list of recent commands (in the console)
* CTRL+1: switch to editor
* CTRL+2: switch to console
* for more - Alt+Shift+K

---
---

# 3. Numbers and math operations

Consider a single number, let's say `5`. This number in R means exactly the same as in mathematics. We can add, multiply, and do much more stuff with this number, for example, operation `5+6` will result in the number `11`:

```R
5+6
```

Another, more complex example:
```R
5 * (12 - 3) + 4 ^ 3 / 2
```

We can create arbitrarily complex calculations by combining numbers, parentheses, and the following arithmetic operators:
* `+` addition
* `-` subtraction
* `*` multiplication
* `/` division
* `%` modulo (returns the remainder of the division operation)
* `^` exponentiation (if you are familiar with Python, this is different)

However, if we only rely on constant numbers, the functionality of our program will be relatively limited. We need to use variables, to unlock a wider range of possibilities.

---
---

# 4. Variables

Variables allow us to store data that can be referenced and manipulated in our program. They also provide a way to label the data, so that it is easier for us to understand what is happening in our program. It is helpful to think of variables as labeled boxes filled with data. Their only purpose is to label and store data in the computer's memory. To create a variable, you just need to name it and set it to the value (by arrow `<-`) you want it to store. This is called assignment operation.

For example,
```R
x <- 42
```

Here, `x` is the variable where the data `42` is stored. Now, whenever we use `x` in our program, we will get `42`.
```R
print(x)
```

As you can see, when we print `x` we get `42` as output. Function `print()` allow us to print some text to the console and user to see it.

You will learn more about functions later - for now, you can think of it similarly to a mathematical function. For instance, `sum(5, 2)` would return `7`.

---

## 4.1. Changing the value of variables

We can also assign a new value to `x`:
```R
x <- 123
print(x)
```

If we display x again, we can see that the value of x has changed.
The previous value of `x` (`42`) has been overwritten by the new value (`123`). We can also reference the variable `x` while assigning a new value to `x`:
```R
x <- x + 1
print(x)
```

In the above situation, R is not trying to solve the mathematical equation `x = x + 1`, which does not have a solution anyway. R first looks at the right-hand side of that equation and checks what was the last value of `x`. Since we have defined `x` as equal to `123` in a previous code cell, R plugs in the value of `123` into the right-hand side of the equation, which results in `x = 123 + 1`. The final result is calculated, which equals `124`, and then the value of that final result is assigned to the variable we have called `x`. The previous value of `x` is overwritten by this new value, which is why the value of x is now `124`, instead of `123`.
```R
x <- x + 1
print(x)
```

If we run the code `x = x + 1` again, the final value assigned to x will be `125`. This is because `x` is currently equal to `124`. Therefore, if we plug it into the right-hand side of the equation, we will get `x = 124 + 1` which is equal to `125`. 

---

## 4.2. Types of variables

Depending on the type of data that you want to store, variables can be divided into the following types.

---

### 4.2.1. Integer variables

```R
x_int <- 42L
print(x_int)
print(class(x_int))
```

In R, we have to explicitly mark integer values (e.g. `7`, `-100`, `444`) with `L`. Integer variables belong to the integer class so, `class(x_int)` returns `"integer"`. Briefly, `class()` function returns a character vector giving the names of the classes of the given object inside the parentheses.

---

### 4.2.2. Floating point variables

```R
x_float <- 42.5
print(x_float)
print(class(x_float))
```

It stores numeric data with decimal values (e.g. `-0.4`, `42.0` - equivalent to `42`, `555.5`).

---

### 4.2.3. Boolean variables

```R
x_bool <- TRUE
print(x_bool)
print(class(x_bool))
```

It stores single-bit data which is either `TRUE` or `FALSE`. Here `x_bool` variable stores the value `TRUE`, which is of class `logical`.

You can use interchangeably `T` and `TRUE` (or `F` and `FASLE`), but it's good practice to use the full form e.g. you can assign different values to `T` or `F`, which can be confusing.

---

### 4.2.4. Character variables

```R
x_char <- 'a'
print(x_char)
print(class(x_char))
```

It stores a single character data (e.g. `b`, ` `, `_`). Here we created `x_char` variable, and assign the character `a` to it. Since character variables belong to the `character` class, `class(x_char)` returns `"character"`.

---

### 4.2.5. String variables

```R
x_str <- 'R is cool'
print(x_str)
print(class(x_str))
```

It stores data that is composed of more than one character. Here, we have created a string variable named `x_str`. You can see that the string variable also belongs to the character class.

Single and double quotes (`'` and `"`) usually can be used interchangeably (not always though).

---
---

# 5. Constants

Constants, as the name suggests, are entities whose value cannot be altered. In R, we can declare constants using the `<-` symbol (as with variables).

---

## 5.1. Types of constants

These are the most common constants in R.

---

### 5.1.1. Integer constant

Integer constants are just the integer values. These constants end with the letter `L` (e.g. `13L`)

---

### 5.1.2. Numeric constant

Numeric constants are numbers with decimal values. They can be expressed as the integers (e.g. `13)`, floating-point numbers (e.g. `1.5`), or exponential numbers (`1e-3`).

---

### 5.1.3. Logical constant

Logical constants are either `TRUE` or `FALSE`.

---

### 5.1.4. String constant

String constants are the string data. For instance, by executing `my_const <- 'LAZARSKI'` we create constant `LAZARSKI` under the name `my_const`.

---

### 5.1.5. Other types of constants

Apart from the types of constants above we can distinguish:
* Complex constants - representing complex numbers (e.g. `1 + 3i`)
* `NULL` - used for declaring an empty R object.
* `Inf/-Inf` - representing positive and negative infinity, respectively. For instance `1/Inf` will return `0`.
* `NaN` (Not a Number) - represents an undefined numerical value (e.g. `0/0`, `Inf/Inf`).
* `NA` - represents a value that is not available.

---

### 5.1.6. Built-In R Constants

We are provided with some predefined constants that can be directly used in our program. For instance, we can type and execute `pi` and we would get pi value (`3.14...`). But it is not good to rely on these, as they are implemented as variables whose values can be changed. After executing `pi <- 11` calling `pi` would print the number `11`, not true pi.

---
---

# 6. Data objects

While you can do many operations in R using data objects that contain a single data item, most of the interesting things you will want to do will involve data objects that contain multiple data items. In this module, we will learn more about vectors and in the next about matrices and data frames.

---

## 6.1. Vectors

A vector, in R, is a list of data items. A vector can contain numbers, character strings, or logical values but not a mixture. All of the data items in a vector must be the same type.

---

### 6.1.1. Creating a vector

One can create a vector by:
```R
my_vec <- c(7, 8, 9, 10, 11)
print(my_vec)
```

The function `c()` combines the numeric values from `7` to `11` into a vector named `my_vec`. You can also obtain the same result using `:`
```R
my_vec2 <- 7:11
print(my_vec2)
```

The annotation `7:11` indicates the series of values from `7` to `11`. If you want to view the contents of the vector after creating it, it can be seen in the RStudio Environment panel. It shows the object name `my_vec2`, the object data type `int`, the size of the object `[1:5]`, and its contents `7 8 9 10 11`.

---

### 6.1.2. Indexing

You can easily access individual elements of a vector. For instance, you can view the 3rd element in the vector by `my_vec[3]`. This is called indexing. The value in the square braces is the location or index you want to access.
```R
print(my_vec[3])
```

You can also index multiple consecutive elements using a `:` in your index notation. So `my_vec[2:4]` will display the data items at the `2`, `3`, and `4` indices of `my_vec`. (If you are familiar with Python this is a little bit different - the last element is also included.)
```R
print(my_vec[2:4])
```

You can also exclude specific data items in a vector. So `my_vec[-5]` will return all of the elements in `my_vec` except the 5th one.
```R
print(my_vec[-5])
```

On the other hand, `my_vec[-(1:3)]` will exclude the 1st, 2nd, and 3rd elements.
```R
print(my_vec[-(1:3)])
```

Notice that the `1:3` series indicator is enclosed in parenthesis. This lets R know that you intend to exclude this series. If you leave out the parenthesis, R will interpret this code as nonsense and return an error message.
```R
print(my_vec[-1:3])
```

R is capable of applying an operation to every element of a vector. For instance, operation `my_vec + 5` adds 5 to each element of `my_vec`. This operation will return a vector of the result of adding `5` to each data item in `my_vec`. Here we are saving the result to the new variable `my_vec3`
```R
my_vec3 <- my_vec + 5
print(my_vec3)
```

One can also apply an operation to a chosen subset of consecutive elements in a vector by indexing. Executing `my_vec[3:5] + 5` will add 5 to the 3rd, 4th, and 5th elements in `my_vec`. 
```R
my_vec4 <- my_vec[3:5] + 5
print(my_vec4)
```

Moreover, one can even use logical operations (like `my_vec > 8`. This operation will return a vector of logical values (`TRUE` or `FALSE`) resulting from comparing each data item in my_vec to the number `8` and determining whether it is greater or not than this number.
```R
my_vec5 <- my_vec > 8
print(my_vec5)
```

---

### 6.1.3. Coercion

Since a vector must consist of elements of the same type, this function will try and coerce elements to the same type if they are different. Coercion is from lower to higher types from `logical` to `integer` to `numeric` to `character`.
Let's see an example:
```R
vec_log <- c(TRUE)
print(vec_log)
print(class(vec_log))
```

The vector `vec_log` consists only of a single boolean element `TRUE`, so its class is `logical`.
```R
vec_int <- c(10L, 20L, TRUE)
print(vec_int)
print(class(vec_int))
```

In this case, along with logical `TRUE` there are two `integer` values - `10L` and `20L`. Since they are objects of another class, the `TRUE` value will be coerced to a higher type `integer`. In computer science, `TRUE` is associated with `1` (and `FALSE` with `0`), so the class of the `vec_int` vector will be `integer`.
```R
vec_num <- c(0.5, 10L, 20L, TRUE)
print(vec_num)
print(class(vec_num))
```

Now, when we append the `numeric` value into the vector `vec_num`, all other values will be coerced to this type.
```R
vec_char <- c(0.5 ,10L, 20L, TRUE, 'friends')
print(vec_char)
print(class(vec_char))
```

In the example above all values in `vec_char` vector will be coerced to the `character` type, since it is the highest type.

---
---

# 7. More about R and RStudio

In this section, we can learn more details about R and RStudio itself.

---

## 7.1. Workspace

More advanced users should consider breaking work contexts into distinct working directories. More details one find here: https://support.rstudio.com/hc/en-us/articles/200711843-Working-Directories-and-Workspaces-in-the-RStudio-IDE

Type `getwd()` to your get current working directory. `setwd('...')` changes the current working directory (or you can click `'session' -> 'set working directory..'`. To check the content of the current working directory use `dir()` function.

Once we created certain objects (such as variables, functions, or constants) we should be able to have an access to them. One can list them with `ls()` instruction. To remove any object (here `x`) use `rm(x)` or to clear all objects currently within the workspace use `rm(list=ls())`.

---

## 7.2. Packages

R packages are a collection of R functions, complied code, and sample data. They are stored under a directory called "library" in the R environment. By default, R installs a set of packages during installation. More packages are added later when they are needed for some specific purpose. When we start the R console, only the default packages are available by default. Other packages which are already installed have to be loaded explicitly to be used by the R program that is going to use them. One can find more details here:
https://www.tutorialspoint.com/r/r_packages.htm

To check installed packages type `search()`. You can install any package with `install.packages('package_name')` instruction, where `package_name` stands for the name of the package you wish to install. Then you can load the package with `library(package_name)` or `require(package_name)`. The main difference between library() and require() is that when the package is not installed the former gives an error and the latter returns `False` (with a warning).
```R
print(library(NotLibrary))
```
```R
print(require(NotLibrary))
```

---

## 7.3. Getting help

If you are not sure how the given function works, you can type `help(function_name)` or `?function_name` to get documentation.

For instance, type `help(sum)` or equivalently `?sum` to get more info about the `sum` function.

Sometimes if `?function_name` won't give you an answer it doesn't mean that this function does not exist. You can extend your search by typing `??function_name`. `?` searches in loaded packages, whereas `??` extends the search to the installed packages.