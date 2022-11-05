################################################################################
### Introduction to programming in R
### 02 Variables and Constants (part 2)
################################################################################

##### OBJECTS ##### (continuation)

### matrices
?matrix
m1 <- matrix(data = 1:100, nrow = 10, ncol =  10, byrow = TRUE)
m1
# if we put arguments in order we can omit their names - more you will learn in a section dedicated to functions
m1 <- matrix(1:100, 10, 10, TRUE)
m1
m2 <- matrix(1:100, 10, 10) # equivalent to matrix(1:100, 10, 10, FALSE), because default value for byrow argument is FALSE
m2

m3 <- matrix(seq(from = -1, to = 1, length = 10), 2, 5)
m3

rep(1, 5) # replicate number 1 5 times
rep(1:2, times = 4) # replicate vector (1, 2) 4 times
m4 <- matrix(rep(1:6, times = 3), 3, 6) # replicate vector (1, ..., 6) 3 times and then create matrix out of it
m4

t(m1) # transpose
m1 == t(t(m1))
all(m1 == t(t(m1)))

dim(m1) # dimensions
m1 %*% m2 # %*% is an operator in R for matrix multiplication

nrow(m4) # number of rows
ncol(m4) # number of columns
colSums(m4) # sum of every columns

cbind(m1, m2) # combine to matrices by columns
rbind(m1, m2) # combine to matrices by rows

m1 == m2
any(m1 == m2)
all(m1 == m2)

# matrix indexing
m1[2, 4] # 2nd row and 4th column
m1[2, ] # 2nd row
m1[, 4] # 4th column
m1[m1 > mean(m1)]

### lists - similar to vectors, but elements of a list can be of different types and different length
# e.g. another list could be an element of a list
my_list <- list(one = 1, two = "a", three = 1:4, four = list(), five = 6)
my_list
names(my_list) # names of lists elements
class(my_list)

# indexing
my_list[3] # return list
class(my_list[3]) # still list
my_list[[3]]         # return just 3rd element of list
class(my_list[[3]])
my_list[[3]][2]      # second element of third element of list

# one can call elements of the list by name
my_list[['three']]
# or use '$' operator
my_list$three # no '' here


### dataframes

friends.df <- data.frame(
  id = c(1:5), 
  name = c('Ross','Rachel','Chandler','Monica', 'Joey'),
  salary = c(1230, 3233.2, 890.3, 1640.3, 2319.3)
)

# to see created dataframe, you can type dataframe_name or print(dataframe_name)
friends.df

# with a View() function you can open dataframe in a new tab
View(friends.df)

dim (friends.df) # (number of rows, number of columns)
# You can also use the ncol() function to find the number of columns and nrow() to find the number of rows:
nrow(friends.df)
ncol(friends.df)

# Get the structure of the data frame.
str(friends.df)
# this way we can check a quick description of dataframe and type of every column

# to obtain the statistical summary we can use
summary(friends.df)


### slicing
# taking certain rows/columns is similar to matrices
friends.df[2, 2] # 2nd row, 2nd column
friends.df[1, 3] # 1st row, 3rd column
friends.df[3, ] # 3rd row
friends.df[1:3, ] # 1-3 rows (inclusive)
friends.df[, 3] # 3rd column

# Extract the 3rd and 5th row with the 1st and 3rd column.
friends.df[c(3,5),c(1,3)]

# with minus '-' one can exclude certain rows or columns from a dataframe
friends.df[-c(1, 3), -2] # without 1st and 3rd row and 2nd column


# in R to extract column (variable) we can also use the name of the column
# (what sometimes can be more convenient than index)
friends.df[['salary']] # or equivalently
friends.df$salary

# we can also use
friends.df['salary']
# which is slightly different than using double [[]], as we receive the dataframe, not the numeric vector
# you can find more details about it here https://stackoverflow.com/questions/1169456/the-difference-between-bracket-and-double-bracket-for-accessing-the-el

### expanding dataframe
# add column (variable)
friends.df$hair <- c('black', 'blonde', 'brown', 'black', 'black')
friends.df

# add row (observation)
friends_new.df <- rbind(friends.df, data.frame(id=6, name='Phoebe', salary='654.6', hair='blonde'))
friends_new.df
# here we are creating a new dataframe (with only one row) add we are combining it by rows with friends.df


### factors

# Let's look at our dataset
friends_new.df
# here we can see, that the hair column has a limited number of unique values

# to check if a given column is a factor one can use is.factor() function
is.factor(friends_new.df$hair) # it is not, let's change it

str(friends_new.df) # hair variable is 'chr' type
summary(friends_new.df) # no additional info about variable

# Factors are created using the factor() function by taking a vector as input.
friends_new.df$hair <- factor(friends_new.df$hair)
is.factor(friends_new.df$hair) # and now it is

# also, now
str(friends_new.df) # hair variable is factor type
summary(friends_new.df) # here we get a count of every level

levels(friends_new.df$hair) # levels are just unique values in factor variable