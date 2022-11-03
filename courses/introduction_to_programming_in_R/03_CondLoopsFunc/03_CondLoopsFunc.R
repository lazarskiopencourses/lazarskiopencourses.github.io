################################################################################
### Introduction to programming in R
### 03 Conditional statements, loops and functions
################################################################################

##### Logical operators #####

# & means 'and', | means 'or'
all(c(TRUE, FALSE) & c(TRUE, FALSE))
all(c(TRUE, FALSE) | c(TRUE, TRUE))

# double && compare only the first elements, resulting in a single-length logical vector.
# single & perform element-wise operation producing result having a length of the longer operand.
c(TRUE, TRUE) &  c(FALSE, TRUE)
c(TRUE, TRUE) &&  c(TRUE, FALSE)
c(TRUE, TRUE) &&  c(FALSE, FALSE)
# In general, at this point it is safer and preferred to use only & and |

# when you deal with logical vectors you can make use of all() and any() functions,
# which compares whether all of the values or any value in a vector is TRUE, respectively.
all(c(TRUE, TRUE) &  c(FALSE, TRUE))
any(c(TRUE, TRUE) &  c(FALSE, TRUE))
any(c(TRUE, FALSE) &  c(FALSE, TRUE))

# exclamation mark stands for logical NOT in R
!TRUE
5 != 4

##### Conditional statements #####

# if (logical_condition){
#   run this expression if logical_condition is TRUE
# }

# for example
my_var <- -1
if (my_var < 0){
  print('my_var is negative')
}

my_var <- 2
if (my_var < 0){
  print('my_var is negative')
} # nothing happens here, because 2 is not less than 0


# we can add 'else' instruction:
# if (logical_condition){
#   run this expression if logical_condition is TRUE
# } else {
#   run this expression if logical_condition is not TRUE (is FALSE)
# }


my_var <- 3
if (my_var < 0){
  print('my_var is negative')
}else print('my_var is positive')

# the condition can't be ambiguous (it has to be either TRUE or FALSE)
if (c(-3,0,3) < 0){
  print('negative')
} # so this is incorrect

# but one can use all/any
if (all(c(-3,0,3) < 0)){
  print('all negative')
} # nothing printed (condition is FALSE), because 0 and 3 are not less than 0


if (any(c(-3,0,3) < 0)){
  print('any negative')
} # condition is TRUE because at least one value (here -3) is less than 0



# in defining conditions we can also use and(&&) / or(||)
my_var <- 5
if (my_var < 0 || my_var > 3){
  print('my_var is lower than 0 or greater than 3') 
} else{
  print('my_var is between 0 and 3 (inclusive)')
}

# ifelse - vectorized version of 'if' function
# ifelse(test condition, do this if condition is TRUE, do this if condition is FALSE)

my_var <- c(-3, 0, 3)
ifelse(my_var < 0, 'less', 'greater')

# what happens here?
a <- 1:3
b <- -(1:3)
ifelse(my_var < 0, a, b)


# Similar to python, the elif statement, short for else if or “otherwise if”,
# is added to the if-else block when there are many more conditions.
# The if-elif-else statement basically consists of several blocks.

# if (logical_condition1){
#   run this expression if logical_condition1 is TRUE
#   ---
# } else if(logical_condition2){
#   run this expression if logical_condition2 is TRUE
# } else {
#   run this expression when neither logical_condition1 nor logical_condition2 is TRUE
# }

# Remember that the code above will execute for just a block when it finds an expression to be true.
# So, if logical_condition1 is TRUE, the code will not even evaluate logical_condition2

x <- 0 # change me
y <- 1

if (y < x){
  print("y is less than x")
}else if(y > x){
  print("y is greater than x")
}else{
  print("x is greater than y")
}


##### Loops #####

# for loop
# iterate over numbers 1:10 - once the iteration is complete, the loop moves onto the next value in the sequence
# and replaces i with the next value (operation i <- i+1 is performed)
for(i in 1:10) {
  cat("current i =", i, '\n')
}
# off-topic: with 'cat' instead of 'print' we can easily combine string with the variable in one line


my_mat <- matrix(1:20, 5, 4)
my_mat
for(i in 1:ncol(my_mat)){
  print(sum(my_mat[,i])) # sum of elements in every column
}


# while loop
# while(logical_condition){ expression }
i <- 0
while(i <= 10)
{
  cat('i =', i, '\n')
  i <- i + 2
}
# Here the loop will only continue to pass values to the main body of the loop (the expression body)
# when i is less than or equal to 10 (specified using the <= operator in this example).
# Once i is greater than 10 the loop will stop.



##### Functions #####

# nameOfFunction <- function(argument1, argument2, ...) {
# expression
# (optionally) return(result) 
# }

# we are creating a function called nameOfFunction. Within the round brackets, we specify
# what information (i.e. arguments) the function requires to run (as many or as few as needed).
# These arguments are then passed to the expression part of the function.
# The expression can be any valid R command or set of R commands and is usually
# contained between a pair of braces { }.

# if a function is only one line long you can omit the braces:
# nameOfFunction <- function(argument1, argument2, ...) {expression}
# for consistency we can stick to using the version with brackets for now

# Once you run the above code, you can then use your new function by typing:
  
# nameOfFunction(argument1, argument2)



# Let's dig into examples:
MyFunction <- function(x, y) {
  x + y^3
}

# executing:
MyFunction(3,2)
MyFunction(-5,0)


MyFunction2 <- function(x) {
  sin_x <- sin(x)
  cos_x <- cos(x)
  sin_x^2+cos_x^2
}

MyFunction2(1)
MyFunction2(pi) # always 1, remember why?


# So far we have not used return() function.
# Using it is not strictly necessary as R will automatically
# return the value of the last line of code in our function.
# It is better and more convenient to include return() function to make this explicit.


MyFunction3 <- function(x, y) {
  sin_x <- sin(x)
  cos_y <- cos(y)
  a <- x+y
  b <- sin_x+cos_y
  print('I will be printed')
  return(c(a*5, b, sin_x)) # one can return not only a single value, but e.g. a vector 
}

MyFunction3(pi/2, 1)

# It is worth noticing that after return() function stops and whatever is later is not executed
MyFunction4 <- function(x, y) {
  sin_x <- sin(x)
  cos_y <- cos(y)
  a <- x+y
  b <- sin_x+cos_y
  return(c(a*5, b, sin_x))
  print('I will not be printed, because I am after return')
}

MyFunction4(pi/2, 1)