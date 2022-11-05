---
title: "Variables and constants 2"
excerpt: "You will learn more about variables and constants"
toc: true
toc_sticky: true
---

<script language="javascript" type="text/javascript">
var scrt_name = "/02_VarConst2"; 
</script>

<script src="https://unpkg.com/vanilla-back-to-top@7.2.1/dist/vanilla-back-to-top.min.js"></script>
<script>addBackToTop()</script>

---
---

# 1. Links to all scripts

## 1.1. Main script

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.R'; return false;" download target="_blank">Variables and Constants 2 .R</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.Rmd'; return false;" download target="_blank">Variables and Constants 2 .Rmd</a>

---

## 1.2. Exercises

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_1.Rmd'; return false;" download target="_blank">Exercise 1</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_2.Rmd'; return false;" download target="_blank">Exercise 2</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_3.Rmd'; return false;" download target="_blank">Exercise 3</a>

---
---

# 2. Introduction

Last time you learned about vectors, among other things. This time we'll spend more time on other data objects in R - matrices, lists, and data frames.

---
---

# 3. Matrices

There will be times when you will want to work with your data organized into a matrix. In R a matrix is an `M x N` (rows x columns) collection of data items. They must all be of the same data type and each row and column must be the same size. You can think of a matrix as stacked vectors next to each other.

---
---

### 3.1. Creating matrix

There are different ways to create the matrix. One way is to combine vectors into a matrix. Let's create a few vectors - `vec1`, `vec2`, and `vec3`.
```R
vec1 <- 1:4
vec2 <- c(2, 5, 10, 20)
vec3 <- rep(2, 4)
print(vec1)
print(vec2)
print(vec3)
```

Now we can create matrix `mat1` using the `matrix()` function. Suppose we want the matrix `mat1` to consist of the above-mentioned vectors arranged vertically, so its size would be `4x3`.
```R
mat1 <- matrix(c(vec1, vec2, vec3), 4, 3)
print(mat1)
```

The first argument of the `matrix()` function is data, so in our case, this is a vector of vectors `c(vec1, vec2, vec3)`. The second argument is the number of rows (`4`) and the third one is the number of columns (`3`).

One can achieve similar results also by the `cbind()` function, which name stands for combine by columns. It takes as input any number of vectors. If one wishes to combine vectors by rows, there is a `rbind()` function. Let's create matrix `mat2`
```R
mat2 <- cbind(vec1, vec2, vec3)
print(mat2)
```

The data items in both matrices are the same. The main difference between how the two techniques create each matrix is the column titles. In `mat2` the column titles are the original vector object names. In `mat1` the columns simply have index identifiers. This difference does not matter because the elements of a matrix are accessed by their indexes only. These column names are cannot be used to access matrix elements.

---

### 3.2. Indexing matrices

You can access the elements of a matrix using indexing. Matrix indexes are quite similar to vector indexes. The only difference is that there are two dimensions instead of one. You now have to identify both the row and the column index. For instance, the code `mat1[3, 1]` will return the value stored in the 3rd row of the 1st column of `mat1`.

```R
print(mat1[3, 1])
```

You can also access entire rows, `mat1[4,]` will return the 4th row of `mat1`.
```R
print(mat1[4,])
```

Similarly, `mat1[,2]` returns the 2nd column of `mat1`. 
```R
print(mat1[,2])
```

You can mix these things and crop whatever piece of the matrix you need. For example, executing `mat1[1:3, 2:3]` will return a matrix containing rows 1 through 3 from columns 2 and 3 from `mat1`.
```R
print(mat1[1:3, 2:3])
```

Similarly, as with vectors, the code `mat1 * 3` will output a matrix containing data items that are the result of multiplying by `3` each data item in `mat1`.
```R
print(mat1 * 3)
```

---
---

## 4. Lists
Lists in R are similar to vectors, but elements of a list can be of different types and different lengths e.g. another list could be an element of a list.

---

### 4.1. Creating list
One can create a list with the `list()` function, where as arguments one can put objects that the list will consist of.
For example,
```R
my_list <- list(one = 1, two = "a", three = 1:4, four = list(), five = 6)
print(my_list)
```

In this way, we have created a list that consists of five elements. The 1st and 5th elements are single numbers, the 2nd one is a character, the 3rd is a numeric vector and the 4th one is an empty list.

---

### 4.2. Indexing lists
To access any element of a list we can use `[]` (as with vectors). As an example, `my_list[3]` will return the 3rd element of this list.
```R
print(my_list[3])
print(class(my_list[3]))
```

Notice, that this operation will return the object that is also of the class `list`. If we want to access the element of the list itself, we can use `[[]]`. We can also access the element of the list by its name using `[[]]` again or `$`. All of these methods provide equivalent output. Let's see some examples.
```R
print(my_list[[3]])
print(class(my_list[[3]]))
print(my_list[['three']])
print(class(my_list[['three']]))
print(my_list$three)
print(class(my_list$three))
```

If we want to access the element of element of the list, we can index it further. For instance, if you would like to see the 2nd element of the 3rd element of the list `my_list` you can type `my_list[[3]][2]`.
```R
print(my_list[[3]][2])
```

---
---

## 5. Dataframes
As you probably remember, this section began by describing an R matrix as an `M x N` collection of data items of the *same* data type. This means that we can't combine vectors of different types into the matrix. Let's see how our matrix `mat2` looked like.
```R
print(mat2)
print(mode(mat2))
```

By executing `mode(mat2)` we can check that our matrix has `numeric` values. But suppose we don't know about the above constraint and we want to merge the `mat2` matrix with the `character` vector.
```R
vec_char <- c('a', 'b', 'c', 'd')
mat3 <- cbind(mat2, vec_char)
print(mat3)
```

This result might be quite surprising, but it makes sense when you remember that the data items in the matrix must be the same data type. In this case, when you combined the character vector `vec_char` to `mat1`, R forced or coerced all of the data elements into a single compatible data type. Since R could not coerce the character strings in `vec_char` to become numeric values, it coerced the numeric values in m1 to become character values.
```R
print(mode(mat3))
```

To verify this we can see that the output of `mode(mat3)` is `"character"`

If you wish to create an R data storage object that contains mixed data types, dataframes come to the rescue.
Data Frames are data displayed in a format like a table (similar to an ordinary excel table). Data Frames are similar to matrices however, as we spoke they can have different types of data inside them, whereas matrices can have only numeric values. So, for instance, while the first column can be `character`, the second and third can be `numeric` or `logical`. However, each column should have the same type of data.

---

### 5.1. Creating dataframe
We can start with our matrix `mat1` and create a data frame with `as.data.frame()` function, which can take the matrix as an input. Next, combine the output with the `vec_char`.
```R
df0 <- as.data.frame(mat2)
df1 <- cbind(df0, vec_char)
print(df1)
```

Notice a few things about the dataframe `df1`. First, the first three columns are numeric and the fourth column is character. You can verify this with the commands: `mode(df$vec1)`, `mode(df$vec2)`, `mode(df$vec3)`, and `mode(df$vec4)`.
```R
print(mode(df1$vec1))
print(mode(df1$vec2))
print(mode(df1$vec3))
print(mode(df1$vec_char))
```

Second, as you may have noticed in those `mode()` commands, you can identify a column of the data frame using its title instead of indexing it. If you recall, this was also the case when accessing elements of lists. Finally, notice that the code you used for this exercise created a data frame out of vectors of the same data type and then added the vector of a different data type.

Another way to create dataframe is by `data.frame()` function, this way we can provide as arguments names and the content of columns. Let's create an artificial dataframe with 3 meals from 3 countries and the ratings associated with them.
```R
food.df <- data.frame(
  id = c(1:3), 
  meal = c('pizza', 'pierogi', 'croissant'),
  rating = c(4, 5, 3),
  country = c('Italy', 'Poland', 'France')
)
print(food.df)
```

---

### 5.2. Accessing dataframe elements
As we spoke, to access a certain column in dataframe we can use the `$` operator. However, we can also use old-fashioned brackets `[]` to extract rows and/or columns based on their indexes (as in matrices).
```R
print(food.df$meal)
print(food.df[3, 4])
```

You should now have a rough idea of how vectors, matrices, and data frames work as data storage objects in R. You will add to this knowledge of these data objects as you become more familiar with R.

---

### 5.3. Off-topic about names
In R, it’s common to use periods in variable names like `my.df` (but not necessarily). There are many syntax differences between R and Python, but you should remember — periods are an operator in Python, so don’t use them in names! The convention in Python is to use underscores, as in `my_list`. In R it's a free-for-all, basically.

---

### 5.4. Factors
Factors are the data objects which are used to categorize the data and store it as levels. They can store both strings and integers. They are useful in columns that have a limited number of unique values. Like `"Male"`, `"Female"` and `"north"`, `"south"`, etc. They are useful in data analysis for statistical modeling, since categorical variables enter into statistical models differently than continuous variables, storing data as factors ensures that the modeling functions will treat such data correctly.

Let's create a vector `days` that is describing days of the week (e.g. of the occurence of some event). To check if the given object is a factor we have used `is.factor()` function. Vector `days` is a plain vector, not a factor, so this function returned `FALSE`.
```R
days <- c('Monday', 'Tuesday', 'Sunday', 'Monday', 'Monday', 'Thursday', 'Wednesday', 'Sunday', 'Monday', 'Saturday', 'Friday', 'Tuesday', 'Sunday', 'Monday')
print(is.factor(days))
```

To create the factor one can use the `factor()` function. The only required argument to factor is a vector of values which will be returned as a vector of factor values. As mentioned before, both numeric and character variables can be made into factors, but a factor's levels will always be character values.
```R
days_fac <- factor(days)
print(days_fac)
print(is.factor(days_fac))
```

As you can see, `days_fac` is in fact factor. Moreover, you can see the possible levels for a factor through the `levels` command. To check the counts of factor levels one can run the `table()` function.
```R
print(table(days_fac))
```

Although the days clearly have an ordering, this is not reflected in the output of the table function. Additionally, comparison operators are not supported for unordered factors. Creating an ordered factor solves these problems - to change the order in which the `levels` will be displayed from their default sorted order, the `levels` argument can be given a vector of all the possible values of the variable in the order you desire. If the ordering should also be used when performing comparisons, use the optional `ordered=TRUE` argument. In this case, the factor is known as an ordered factor.
```R
days_fac_ord <- factor(days, levels=c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'), ordered=TRUE)
print(table(days_fac_ord))
```

To sum up, factors represent a very efficient way to store character values, because each unique character value is stored only once, and the data itself is stored as a vector of integers.
