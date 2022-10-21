################################################################################
### Introduction to programming in R
### 01 Variables and constants (part 1)
################################################################################

# There are many online tutorials on how to install R and RStudio, you can start from here:
# https://rstudio-education.github.io/hopr/starting.html

### some useful keyboard shortcuts
# CTRL+ENTER / CTRL+R: run instructions from the script (current line or marked part of code)
# CTRL+L: clear console
# CTRL+arrow up: list of recent commands
# CTRL+1: switch to editor
# CTRL+2: switch to console
# for more - Alt+Shift+K

##### Introduction #####

# R is a popular programming language used for statistical computing and graphical presentation.
# It is a great resource for data analysis, data visualization, data science and machine learning
# It provides many statistical techniques (such as statistical tests, classification, clustering and data reduction)
# It is easy to draw graphs in R, like pie charts, histograms, box plots, scatter plots, etc.
# It works on different platforms (Windows, Mac, Linux)
# It is open-source and free
# It has a large community support
# It has many packages (libraries of functions) that can be used to solve different problems

### getting help
help(sum)
?sum
# sometimes if ?function_name won't give you an answer it doesn't mean that this function does not exist
# you can extend your search by typing ??function_name
# ? searches in loaded packages, whereas ?? extends the search to the installed packages

### working directory
getwd() # get current working directory

# setwd('...') # change current working directory
# or click 'session' -> 'set working directory..'

dir() # content of current working directory

### packages

# R packages are a collection of R functions, complied code and sample data.
# They are stored under a directory called "library" in the R environment.
# By default, R installs a set of packages during installation.
# More packages are added later when they are needed for some specific purpose.
# When we start the R console, only the default packages are available by default.
# Other packages which are already installed have to be loaded explicitly to be used by the R program
# that is going to use them.
# https://www.tutorialspoint.com/r/r_packages.htm
search() # installed packages
install.packages('cowsay') # installing package named 'cowsay'
library(cowsay) # loading package or with require(data.table)
# main difference between library() and require() is that when the package is not installed
# the former gives an error and the latter returns False
require(plyr)

##### Basic maths operators and statistical functions #####

### assignment operation
x <- 9
# in the upper right corner 'Environment' you can see defined variables
x
# if you want to see the value of a new variable in the console straight away
# you can assign this variable in parentheses
(x <- 9)


### math operations
x * 3
x - 1

# for now we have just printed new values (e.g. x-1 = 9-1 = 8). The value of x has not changed
x

# to change the value of x you have to assign a new value (right-hand side) to the variable (left-hand side)
y <- x - 1
y

# different types of division
x / 2

5%% 3 # remainder
5 %/% 3 # integer part of division

# assigning values to variables and comparing them
a <- 3
b <- 4
a == b # equal
a > b # greater
a < b # less
a != b # not equal

# simple examples
2 == 3
2 + 2 == 4
3 < 5
3 <= 5 # less or equal
3 >= 5 # greater or equal
3 <= 5 | 10 > 20 # or
3 <= 5 & 10 > 20 # and

## some of the built-in functions
abs(-9)
sqrt(25)
sum(5, 2)
cos(pi)
sin(pi)
factorial(3)
log(10)
log10(10)
logb(base = 100, x = 10)
exp(1)
round(pi, 2)
round(1.234, digits = 2)

ceiling(3.3) # rounding up
floor(3.6)  # rounding down
trunc(5.9) # rounding to 0
trunc(-1.5)
floor(-1.5)
ceiling(-1.5)

### assigning
z <- 3 # the most popular (Alt+minus)

# In R you can use both '=' and '<-' for assigning, the differences are pretty subtle, e.g.
sum(vec1 = 1:5)
vec1 # vec1 not found, we haven't created it
sum(vec2 <- 1:5)
vec2 # vec2 created in the workspace

# It is better to just consistently use '<-'


### workspace
ls() # content of workspace
rm("x") # remove element from workspace
rm(list = ls()) # remove whole content of workspace (which is ls())

##### Types of variables #####
int <- 4L
int
typeof(int)

float <- 1.5
float
typeof(float)

text <- "tekst"
text
typeof(text)

bool <- TRUE
bool

typeof(bool)
# You can use interchangeably T and TRUE (or F and FASLE), but it's good practice to use the full form
# e.g. you can assign different values to T or F, which can be confusing.

### strings

# We define strings with quotes
my_str1 <- 'friend'
# ' and " quotes usually can be used interchangeably (not always though)
my_str2 <- "friend"

my_str1 == my_str2

### constants
Inf # infinity
Inf + 2
24 / 0
-Inf
-24 / 0

NaN # Not a Number
0 / 0
Inf - Inf

# Both NA and NULL are used to represent missing or undefined values
# They have different properties, in the beginning is better to use just NA
NULL
NA
NA + 3 # still NA
NA == 5 # still NA
is.na(NA) # used mainly for cleaning data
is.na(3)


# class is a different thing from type, one can find more details here:
# https://stackoverflow.com/questions/6258004/types-and-classes-of-variables
typeof(1)
class(1)


##### Objects #####

### scalars
n <- 100
n

### vectors: all elements have to be of the same type
v1 <- 3:13 # one way to define vector of consecutive numbers
v1
v2 <- c(1, 4, 6, 3, 11, 3) # another way to define vector
v2
typeof(v2)
sort(v2) # sorted vector
length(v2) # number of elements in vector
unique(v2) # unique values in vector
sum(v1) # sum of elements in vector

v3 <- c('Somebody', 'once', 'told', 'me') # text vector
typeof(v3)
v4 <- c() # empty vector
v5 <- 11:20
v1 + v5

# Since a vector must consist of elements of the same type, this function will try and coerce elements
# to the same type if they are different.
# Coercion is from lower to higher types from logical to integer to double to character.
c(TRUE) # logical
c(10, 20, TRUE) # integer (TRUE as 1)
c(0.5, 10, 20, TRUE) # double
c(0.5 ,10, 20, TRUE, 'friends') # character
# the whole vector is coerced to the highest type

### slicing:
v3
v3[3] # third element (we start counting from 1 not 0 like in python)
v1[2:4] # 2nd to 4th element (inclusive)
v1[c(2, 3, 10)] # 2nd, 3rd and 10th element
v1[v1 < 4 | v1 > 6] # elements of vector v1 that are less than 4 or greater than 6 
v1[v1 > 4 & v1 < 8] # elements of vector v1 that are greater than 4 and less than 8 

# index exceeding a length of the vector
v3
length(v3)
v3[100] # NA

v3[-1] # all but the first element

### text vectors
vec_txt <- c('LAZARSKI', 'PW', 'UW', 'SGGW', 'SGH', 'LAZARSKI')
length(vec_txt) 
vec_txt_u <- unique(vec_txt) # only unqiue elements
length(vec_txt_u)
vec_txt_u <- sort(vec_txt_u) # sort works not only on numbers, but on texts as well
vec_txt_u

vec_txt_u[1]
vec_txt_u[2:3]
vec_txt_u[c(1, 3, 4)]

nchar('LAZARSKI') # number of characters in a string
nchar(vec_txt_u) # this function is vectorized - it will count number of characters for every element in a vector

w <- c(4, 16, 25, 8, 1, 0, 5, 3, 9.6)
w
k <- sqrt(w) # this function is vectorized as well
k

### vector operations
v1 <- c(1, 2, 3, 4)
v2 <- c(3, 5, 4.3, 5.8)
v3 <- c(10, 1000)
v4 <- c(10, 200, 3000)

2 * v1
v1 / 2
v1^2

# broadcasting
v1 + v2
v1 + v3 # v1 has 4 elements, v3 has 2 elements, so we get (v1[1]+v3[1], v1[2]+v3[2], v1[3]+v3[1], v1[4]+v3[2])
v1 + v4 # v1 has 4 elements, v4 has 3 elements, so we get (v1[1]+v4[1], v1[2]+v4[2], v1[3]+v4[3], v1[4]+v4[1])
# with a warning that a longer object length is not a multiple of a shorter object length

# other operations 
z <- 1:200
5 %in% z # is number 5 in vector z?

c(3, 100, 2000) %in% z # is number 3, 100, 2000 in vector z? (vectorized)

# sequences
test_vec <- 1:10
test_vec

test_vec2 <- 10:0
test_vec2

?seq
seq(-1, 1, 0.1) # equivalent to
seq(from = -1, to = 1, length = 21)

seq(1, 1, length = 21)

rep(3, 8)
rep('LAZARSKI', 3)

rep(0:1, times = 5)
rep(0:1, each = 5)