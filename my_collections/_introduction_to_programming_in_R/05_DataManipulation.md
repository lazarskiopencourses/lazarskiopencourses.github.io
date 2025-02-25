---
title: "Data manipulation"
excerpt: "Every data scientist should know that"
toc: true
toc_sticky: true
---

<script language="javascript" type="text/javascript">
var scrt_name = "/05_DataManipulation"; 
</script>

---
---

# 1. Links to all scripts

## 1.1. Main script

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.R'; return false;" download target="_blank">Data manipulation .R</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.Rmd'; return false;" download target="_blank">Data manipulation .Rmd</a>

---

## 1.2. Exercises

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_1.Rmd'; return false;" download target="_blank">Exercise 1</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_2.Rmd'; return false;" download target="_blank">Exercise 2</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_3.Rmd'; return false;" download target="_blank">Exercise 3</a>

---
---

# 2. Introduction

The dplyr is a popular R package that provides a set of functions for efficiently manipulating and summarizing data frames. It is a key tool in the tidyverse, a collection of packages for data manipulation and visualization that are designed to work well together.

We'll start by covering the basics of the dplyr package, including how to install and load it into your R environment. Then, we'll go over some of the most common dplyr functions, including `filter()`, `select()`, `arrange()`, `mutate()`, and `summarize()`. We'll also cover some helpful tips and tricks for using dplyr effectively.

By the end of this tutorial, you should have a solid foundation in using dplyr to manipulate and summarize data frames in R. Let's get started!

---
---

# 3. Installing and loading

To install and load the dplyr package in R, you can use the following commands:
```R
install.packages('dplyr') # Install dplyr package

library(dplyr) # Load dplyr package
```

The first command installs the dplyr package from CRAN (the Comprehensive R Archive Network), which is the main repository for R packages. If you have already installed dplyr, this command will not install it again. In this case, you can just put `#` at the beginning of this line and R will not execute it. The second command loads the dplyr package into your current R session, allowing you to use its functions. You only need to do this once per R session.

Once you have installed and loaded the dplyr package, you are ready to start using its functions to manipulate and summarize data in R.

---
---

# 4. Functions
Now, let's say we have a data frame called df with columns x, y, and z.
```R
df <- data.frame(x = c(1, 2, 2, 2, 3),
                 y = c(6, 10, 7, 9, 7),
                 z = c('a', 'b', 'c', 'd', 'e'))
```

This data frame has 5 rows and 3 columns: `x`, `y`, and `z`.

---

## 4.1. Describe the structure and content
There are several functions in R that you can use to describe the structure and content of a data frame.

---

### 4.1.1. Head and Tail
`head()` displays the first few rows of a data frame. By default, it displays the first `6` rows, but you can specify a different number of rows using the `n` argument. For example, `head(df, n=4)` will display the first 4 rows of the data frame `df`.
```R
head(df, n=4)
```

`tail()`, in a similar manner, displays the last few rows of a data frame.

---

### 4.1.2. Dim
`dim()` displays the number of rows and columns in a data frame. For instance, `dim(df)` will display the number of rows and columns in the data frame `df`.
```R
dim(df)
```

---

### 4.1.3. Str
`str()` displays the structure of a data frame, including the data types of each column and the number of rows - `str(df)` will display the structure of the data frame `df`.
```R
str(df)
```

---

### 4.1.4. Summary
`summary()` displays a summary of a data frame, including the number of rows, the number of columns, the mean, median, and range of each numeric column, and the frequency of each factor level.
```R
summary(df)
```

---

## 4.2. Filter
The `filter()` function allows you to subset a data frame based on certain criteria. For example, to keep only the rows where the value of `x` is greater than `1`, we can use the following code:
```R
filter(df, x > 1)
# df %>% filter(x > 1)
```

The second line is equivalent to the first line. How the `pipe` (`%>%`) operator works is explained at the end of this tutorial. You will be provided with both versions in this tutorial.

We can also use multiple criteria by separating them with the `&` operator:
```R
filter(df, x > 1 & y < 10)
# df %>% filter(x > 1 & y < 10)
```

---

## 4.3. Select
The `select()` function allows you to choose specific columns from a data frame. For example, to select only the columns `x` and `y`, we can use the following code:
```R
select(df, x, y)
# df %>% select(x, y)
```

---

## 4.4. Arrange
The `arrange()` function allows you to sort a data frame by one or more columns. In particular, to sort `df` by the values in the `x` column in ascending order (in the case of `df` nothing changes, as `x` is already sorted), we can use the following code:
```R
arrange(df, x)
# df %>% arrange(x)
```

To sort in descending order, we can use the `desc()` function:
```R
arrange(df, desc(x))
# df %>% arrange(desc(x))
```

We can also sort by multiple columns by providing multiple arguments to the `arrange()` function. For instance, to sort by `x` in descending order and then by `y` in ascending order, we can use the following code:
```R
arrange(df, desc(x), y)
# df %>% arrange(desc(x), y)
```

Note, that when using multiple arguments in the `arrange()` function, the data frame is sorted by the first argument (`desc(x)`) in the desired order (in our case descending), and then ties are broken by the second argument (`y`) in the desired order (in our case ascending). We can provide more arguments similarly.

---

## 4.5. Mutate
The `mutate()` function allows you to add new columns to a data frame based on existing columns. For example, to add a new column `w` that is equal to the value of `x` multiplied by `2`, we can use the following code:
```R
mutate(df, w = x * 2)
# df %>% mutate(w = x * 2)
```

We can use the `mutate()` function to add a new column `w` that is the sum of `x` and `y`:
```R
mutate(df, w = x + y)
# df %>% mutate(w = x + y)
```

We can also use the `mutate()` function to apply a function to a column. For example, to add a new column `w` that is the square root of `x`, we can use the following code:
```R
mutate(df, w = sqrt(x))
# df %>% mutate(w = sqrt(x))
```

We can also chain multiple `mutate()` functions together to add multiple new columns to the data frame. For instance, to add both the `a` and `w` columns as shown above, we could use the following code:
```R
mutate(df, a = x + y, w = sqrt(x))
# df %>% mutate(a = x + y, w = sqrt(x))
```

---

## 4.6. Group_by and Summarize
The `group_by()` and `summarize()` functions in R, which are part of the dplyr package, allow you to group a data frame by one or more variables and compute summary statistics for each group.

The `group_by()` function takes a data frame and one or more variables as arguments and returns a new data frame with the data grouped by the specified variables.

We can use the `group_by()` function to group the data frame by the `x` column like this:
```R
group_by(df, x)
# df %>% group_by(x)
```

We can see that `group_by()` alone does not change the data frame.

We can also use the `summarize()` function to compute multiple summary statistics at once. For example, to compute the mean, median, and standard deviation of the `y` column for each group, we can use the following code:
```R
df %>%
  group_by(x) %>%
  summarize(mean = mean(y),
            median = median(y),
            sd = sd(y))
```

This will return a new data frame with one row for each unique value of `x`, and columns mean, median, and sd that contain the mean, median, and standard deviation of the `y` column for each group. `sd` is not computed for groups `x` equals `1` and `3`, as there is only one sample for this groups.

You can use any function inside the summarize() function as long as it returns a single value. This includes:
* `mean()`: calculates the mean of a vector.
* `median()`: calculates the median of a vector.
* `sd()`: calculates the standard deviation of a vector.
* `min()`: calculates the minimum value of a vector.
* `max()`: calculates the maximum value of a vector.
* `sum()`: calculates the sum of a vector.
* `quantile()`: calculates a specified quantile of a vector.
* `var()`: calculates the variance of a vector.
* `range()`: calculates the range (maximum minus minimum) of a vector.
* `n()`: counts the number of rows in a group.
* `n_distinct()`: counts the number of distinct values in a group.

You can also use your own custom functions or functions from other packages.

---
---

# 5. Pipe operator
The pipe operator (`%>%`) in R is a convenient way to chain together multiple operations on a data object, allowing you to write code in a more readable and concise manner. It is commonly used with the dplyr package for data manipulation.

The pipe operator takes the output of the expression on its left-hand side and passes it as the first argument to the function on its right-hand side. For example, consider the following code:
```R
df %>% filter(y > 6)
```

This is equivalent to writing:
```R
filter(df, y > 6)
```

The pipe operator allows you to chain together multiple operations on the same data object, making your code more readable and easier to understand. For example, consider the following code:
```R
df %>%
  filter(y > 6) %>%
  select(x, z) %>%
  arrange(desc(x))
```

This code filters the data frame `df` to keep only rows where `y` is greater than `6`, selects only the columns `x` and `z`, and then sorts the resulting data frame by the `x` column in the descending order. Without the pipe operator, this code would look like this:
```R
arrange(select(filter(df, y > 6), x, z), desc(x))
```

which is much less readable and harder to understand.

The dplyr package in R provides a set of functions for data manipulation, including filtering, selecting, arranging, and mutating data frames, as well as grouping and summarizing data. These functions can be used with the dplyr syntax or the pipe operator (`%>%`) to chain together multiple operations on the same data object.

In addition to the main functions mentioned earlier, the dplyr package also includes several other useful functions for data manipulation. These include:
* `rename()`: renames columns in a data frame.
* `transmute()`: creates new columns in a data frame based on existing columns and drops all other columns.
* `summarize_all()`: computes summary statistics for all columns in a data frame.
* `summarize_at()`: computes summary statistics for specified columns in a data frame.
* `summarize_if()`: computes summary statistics for columns in a data frame that meet a specified condition.
If you want to gain a more comprehensive understanding of data manipulation in R you can study these functions and others in the dplyr package. This package is widely used in data analysis and is an important tool to have in your toolkit.