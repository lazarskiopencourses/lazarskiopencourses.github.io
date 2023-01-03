################################################################################
### Introduction to programming in R
### 05 Data manipulation (part 1)
################################################################################

# How to read data from csv file?

# read.csv vs read_csv
# read_csv from readr package is 2-3x faster
# even faster is fread from data.table package (beyond the scope of the course)

# install.packages('readr')
library(readr)
?read_csv

# dplyr - crucial package for every data scientist/analyst in R for data manipulation

# dplyr is a grammar of data manipulation, providing a consistent set of verbs
# that help you solve the most common data manipulation challenges:
# mutate() adds new variables that are functions of existing variables
# select() picks variables based on their names.
# filter() picks cases based on their values.
# summarise() reduces multiple values to a single summary.
# arrange() changes the ordering of the rows.

# useful cheatsheet https://github.com/rstudio/cheatsheets/blob/main/data-transformation.pdf

# install.packages('dplyr')
library(dplyr)


# Let's use built-in dataset mtcars
# This dataset is a built-in dataset in R that contains measurements on 11 different attributes
# for 32 different cars.
# Documentation: https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/mtcars

data(mtcars) # loading data

dim(mtcars) # 32 rows (observations, here cars), 11 columns (variables, here cars attributes)
names(mtcars) # names of variables

summary(mtcars) # quickly summarize each variable in the dataset

head(mtcars)
# with the head() function we can inspect the data set (see the first 6 cases)
# you can specify how many examples you want to see with n argument
head(mtcars, n=2)

# analogously for tail() function
tail(mtcars, n=4)


# filtering
filter(mtcars, cyl==8, gear==5) # filter cars with 8 cylinders and 5 forward gears
# equivalent to (without dplyr)
mtcars[mtcars$cyl==8 & mtcars$gear==5, ]

filter(mtcars, cyl==6 | cyl==8) # filter cars with 6 or 8 cylinders
filter(mtcars, cyl %in% c(6,8)) # equivalent and more convinient

# indexing rows by their (integer) locations
slice(mtcars, 1:3)

# sort data in ascending order by the number of cylinders
arrange(mtcars, cyl)

# sort data in ascending order by following columns
# first number of cylinders, then, if cyl is equal mpg (Miles/(US) gallon)
arrange(mtcars, cyl, mpg)

# sort data in descending order by the number of cylinders
arrange(mtcars, desc(cyl))


# selecting certain columns
select(mtcars, mpg, disp, gear)
select(mtcars, cyl:am) # column range
select(mtcars, -(cyl:am)) # all but this column range


# renaming column
rename(mtcars, automatic = am)
select(mtcars, am) # error - there is no longer this column in dataset


# selecting only distinct (unique) values
distinct(mtcars, cyl)
distinct(mtcars, cyl, am)


# creating new columns
mtcars2 <- mutate(mtcars,
           hund_mpg = mpg/100, # hundreds of miles / gallon
           tous_mpg = hund_mpg/10) # you can use variable created just before

head(mtcars2)

# only new columns
transmute(mtcars,
          hund_mpg = mpg/100,
          tous_mpg = hund_mpg/10)


# random observations
sample_n(mtcars, 5) # 5 observations
sample_frac(mtcars, 0.05) # 5% of observations




# Group_by() function groups the data frames.
# Group_by() function alone will not give any output.
# It should be followed by summarise() function with an appropriate action to perform.
# If you are familiar with it, it works similarly to GROUP BY in SQL and pivot table in excel.

# group_by() on a single column

# select() dziala identycznie, ale grupujace zmienne sa zachowywane
mtcars3 <- group_by(mtcars, cyl)
mtcars3_gp <- summarise(mtcars3, 
                        mean_mpg = mean(mpg))
mtcars3_gp # mean mpg for every number of cylinders

# Let's stop for a moment and introduce the pipe operator
# The pipe operator is a special operational function
# which allows us to pass the result of one function/argument to the other one in sequence.
# It is generally denoted by symbol %>% in R Programming. Usage of this operator increases 
# readability, efficiency, and simplicity of your code when you have nested functions in your code loop.

# Above operations we can simplify to:
mtcars_gp_pipe <- group_by(mtcars, cyl) %>% 
  summarise(mean_mpg = mean(mpg)) # here we didn't have to pass an additional dataset argument (mtcars3 above)

mtcars_gp_pipe

# The pipe operator is extremely useful when dealing with datasets under dplyr package


# group_by() on multiple columns
mtcars_gp_pipe2 <- group_by(mtcars, cyl, am) %>% 
  summarise(mean_mpg = mean(mpg))
mtcars_gp_pipe2

# then we can use the filter function
filter(mtcars_gp_pipe2, mean_mpg > 20)


# we can also count cases in every group
mtcars_GP_pipe3 <- group_by(mtcars, gear) %>% 
  summarise(count_gear = n())

mtcars_GP_pipe3