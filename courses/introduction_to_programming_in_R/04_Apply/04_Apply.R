################################################################################
### Introduction to programming in R
### 04 Apply family functions
################################################################################


##### Apply family #####

# When dealing with loops in R, more advanced users should get familiar with apply family functions
# Some of these functions can be i) faster than raw loops and ii) often more convenient to implement

# The apply family pertains to the R base package (so you don't have to install additional packages) and is
# populated with functions to manipulate slices of data from matrices, arrays, lists or dataframes in a repetitive way.
# These functions allow manipulating the data in a number of ways and avoid explicit use of loop constructs.
# They act on an input list, matrix or array and apply a named function with one or several optional arguments.

# The called function could be:
# An aggregating function, like for example the mean, or the sum (that returns a number or scalar);
# Other transforming or subsetting functions; and
# Other vectorized functions, which yield more complex structures like lists, vectors, matrices, and arrays.


##### apply #####
# The apply() function lets us apply a function to the rows or columns of a matrix or data frame.
# Apply() takes a dataframe or matrix as an input along with function and whether it has to be
# applied by row or column and gives output in vector, list or array.
# Apply function in R is primarily used to avoid explicit uses of loop constructs.

# let's create a simple matrix
mat1 <- matrix(1:10, nrow=5, ncol=6)
mat1

# apply function takes 3 arguments:

# apply(X, MARGIN, FUN)
# Here:
# -X: an array or matrix
# -MARGIN:  take a value or range between 1 and 2 to define where to apply the function:
# -MARGIN=1`: the manipulation is performed on rows
# -MARGIN=2`: the manipulation is performed on columns
# -MARGIN=c(1,2)` the manipulation is performed on rows and columns
# -FUN: tells which function to apply. Built functions like mean, median, sum, min, max and
# even user-defined functions can be applied>

# so with this example
a_mat1 <- apply(mat1, 2, sum)
a_mat1
# we apply sum function on columns of matrix mat1

a_mat2 <- apply(mat1, 1, sum)
a_mat2
# here we apply sum function on rows of matrix mat1


##### lapply #####
# The lapply() function is useful for performing operations on list objects and returns a list object
# of the same length as the original set. lappy() returns a list of a similar length as an input list object,
# each element of which is the result of applying FUN to the corresponding element of a list.
# Lapply in R takes a list, vector or data frame as an input and gives output in the list.

# l in lapply() stands for list. The difference between lapply() and apply() lies between the output return.
# The output of lapply() is a list. lapply() can be used for other objects like data frames and lists.
# Since the lapply() function applies a certain operation to all the elements of the list it doesn’t need a MARGIN.

# lapply(X, FUN)
# Arguments:
# -X: A vector or an object
# -FUN: Function applied to each element of X	

# example:
movies <- c("MAMMA MIA", "BATMAN", "GODFATHER")
movies_lower <- lapply(movies, tolower)
str(movies_lower)
# here we applied tolower function (which changes the string value to lower case) to movies vector
# output is a list
class(movies_lower)

# to convert it back to a vector we can use unlist() function
unlist(movies_lower)
class(unlist(movies_lower))


# another example:
my_list <- list(1:10, seq(1, 30, 4), rep('a', 5), 'orange')
length(my_list)

lapply(my_list, length)
lapply(my_list, function(element){
  if (length(element) > 3) 'More than 3 elements' else 'Less than or equal 3 elements'
})
# here we created a custom FUN function

# You can also notice that the output is always a list with as many elements as the element in the input


##### sapply #####
# The sapply() function takes list, vector or data frame as input and gives output in vector or matrix.
# It is useful for operations on list objects and returns a list object of the same length as the original set.
# The sapply() function behaves similarly to lapply(); the only real difference is in the return value.
# The sapply() will try to simplify the result of lapply() if possible.

# Essentially, sapply() calls lapply() on its input and then applies the following algorithm:
# If the result is a list where every element is length 1, then a vector is returned
# If the result is a list where every element is a vector of the same length (> 1), a matrix is returned.
# If neither of the above simplifications can be performed then a list is returned

# sapply(X, FUN)
# Arguments:
# -X: A vector or an object
# -FUN: Function applied to each element of X

# Let's use small built-in dataset 'cars' with two variables, 'speed' and 'dist' 
cars

lmn_cars <- lapply(cars, min)
smn_cars <- sapply(cars, min)
lmn_cars
class(lmn_cars)
smn_cars
class(smn_cars)
# Can you spot the difference?

# same output can be achived by:
lmn2_cars <- sapply(cars, min, simplify = FALSE) # list with sapply()
smn2_cars <- unlist(lapply(cars, min)) # vector with lapply()


##### mapply #####
# The mapply() function is a multivariate version of apply. Its purpose is to be able to vectorize
# arguments to a function that is not usually accepting vectors as arguments.
# In short, mapply() applies a Function to Multiple List or multiple Vector Arguments.

# mapply(X, FUN)
# Arguments:
# -FUN: Function applied to each element of X
# -...: Arguments to vectorize over

# create a 3x3 matrix using rep() function
mat_normal <- matrix(c(rep(1, 3), rep(2, 3), rep(3, 3)), 3, 3)
mat_normal

# or using mapply() function
mat_mapply <- mapply(rep,1:3,3)
mat_mapply

all(mat_normal == mat_mapply) # same matrix as an output



# As an R practitioner you will get lots of hands-on experience with apply family function
# To sum up:
# apply() for matrices and data frames
# lapply() for lists…output as list
# sapply() for lists…output simplified
# tapply() for vectors


# There are another functions in this family such as
# mapply: multivariate version of lapply
# rapply: recursive apply
# vapply: similar to sapply(), requires specifying the format of the output in advance
# that you will use more and more during your adventure with R