---
title: "Apply family"
excerpt: "R must see"
toc: true
toc_sticky: true
---

<script language="javascript" type="text/javascript">
var scrt_name = "/04_Apply"; 
</script>

---
---

# 1. Links to all scripts

## 1.1. Main script

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.R'; return false;" download target="_blank">Apply .R</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.Rmd'; return false;" download target="_blank">Apply .Rmd</a>

---

## 1.2. Exercises

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_1.Rmd'; return false;" download target="_blank">Exercise 1</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_2.Rmd'; return false;" download target="_blank">Exercise 2</a>
* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+'/Exercises'+scrt_name+'_task_3.Rmd'; return false;" download target="_blank">Exercise 3</a>

---
---

# 2. Introduction

The `apply()` family of functions in R provides a way to apply a function to a matrix or array in a way that is similar to using a loop. This can be useful for applying a function to each element of a matrix or array, or to each row or column of a matrix.

---
---

# 3. Apply

Let's see an example of how to use `apply()` to apply a function to each element of a matrix. Suppose we have a matrix `A` and we want to apply the `sqrt()` function to each element of the matrix. We can do this using the `apply()` function like this:

```R
A <- matrix(1:9, nrow = 3)
print(A)

apply(A, 2, sqrt)
```

The first argument to `apply()` is the matrix `A`, and the second argument is the margin. The margin specifies whether we want to apply the function to the rows (`1`) or the columns (`2`) of the matrix. In this case, we have specified `2`, so the function will be applied to each column of the matrix.

The third argument to `apply()` is the function that we want to apply. In this case, we have specified `sqrt()`, so the square root of each element in the matrix will be calculated.

---
---

# 4. Lapply

Another function is `lapply()`. First, let's look at the example of how to use `lapply()` to apply a function to each element of a list.
```R
x <- list(a = 1:5, b = 6:10, c = 11:15)
print(x)

lapply(x, mean)
```

The first argument to `lapply()` is the list `x`, and the second argument is the function that we want to apply. In this case, we have specified `mean()`, so the mean of each element in the list will be calculated.

So what's the difference between `apply()` and `lapply()`?
You can use `lapply()` when you want to apply a function to each element of a list and return the result as a list. This can be useful when you want to preserve the structure of the original list, or when you want to apply a function to each element of a list that returns a list itself.

The main difference between `lapply()` and `apply()` is the type of input that they expect. `lapply()` expects a list as its first argument, while `apply()` expects a matrix or array. In addition, `lapply()` always returns a list, while `apply()` can return an array or a vector, depending on the dimensions of the input and the value of the `MARGIN` argument.

Here is an example of how to use `lapply()` and `apply()` to apply the same function to a list and a matrix, respectively:
```R
# Create a list and a matrix
x <- list(a = 1:5, b = 6:10, c = 11:15)
A <- matrix(1:9, nrow = 3)

# Apply the mean function to each element of the list and the matrix
lap_result <- lapply(x, mean)
print('Printing lapply results:')
print(lap_result)

ap_result <- apply(A, 2, mean)
print('Printing apply results:')
print(ap_result)
```

As you can see, `lapply()` returns a list with the mean of each element of the list, while `apply()` returns a vector with the mean of each column of the matrix.

---
---

# 5. Sapply

The `sapply()` function in R is a useful tool for applying a function to a list or vector and trying to simplify the result to a vector or matrix if possible. This function is similar to the `lapply()` function, but it returns a simpler object, which can be easier to work with in some cases.

Essentially, `sapply()` calls `lapply()` on its input and then applies the following algorithm:
* If the result is a list where every element is length `1`, then a vector is returned
* If the result is a list where every element is a vector of the same length (`>1`), a matrix is returned.
* If neither of the above simplifications can be performed then a list is returned

So let's see how it differs from `lapply()`. As mentioned above, the `lapply()` function applies a function to each element of a list or vector and returns a list with the results. For example:
```R
x <- c(1, 2, 3, 4, 5)

square <- function(x) {
  x^2
}

lap_result <- lapply(x, square)
print(lap_result)
print(class(lap_result))
```

This will return a list with the squared values of the elements of `x`. 

The `sapply()` function in this manner is similar to `lapply()`, but it tries to simplify the result to a vector or matrix if possible. For example:
```R
sap_result <- sapply(x, square)
print(sap_result)
print(class(sap_result))
```

This, on the other hand, will return a vector with the squared values of the elements of `x`. 

In general, `lapply()` is useful when you want to keep the results in a list, while `sapply()` is useful when you want to simplify the results to a vector or matrix if possible. However, it is important to note that `sapply()` may not always be able to simplify the results, in which case it will return a list like `lapply()`.

It is also worth noting that `sapply()` has an additional argument called `simplify`, which allows you to specify whether or not you want the results to be simplified. By default, `simplify` is set to `TRUE`, but you can set it to `FALSE` if you want `sapply()` to return a list just like `lapply()`.

For instance:
```R
x <- c(1, 2, 3, 4, 5)

square <- function(x) {
  x^2
}

# By default, simplify is set to TRUE
sapply(x, square)  # returns a vector

# Set simplify to FALSE to return a list
sapply(x, square, simplify = FALSE)  # returns a list
```

---
---

# 6. Mapply

`mapply()` is a function that allows you to apply a function to multiple sets of arguments in parallel. It is similar to the `apply()` function, but allows you to pass multiple arguments to the function instead of just one.

Here is an example of how to use `mapply`:
```R
# Define a function that takes two arguments
myfunction <- function(x, y) {
  return(x + y)
}

# Create two vectors of arguments
x <- c(1, 2, 3)
y <- c(10, 20, 30)

# Apply the function to the arguments using mapply
result <- mapply(myfunction, x, y)

# Print the result
print(result)
```

This will apply the `myfunction` function to the elements of `x` and `y` in parallel, resulting in a vector of the sums of the corresponding elements. In this case, the output will be `11 22 33`.

---
---

# 7. Other functions
There are several other functions in `apply()` family, each of which has a specific purpose and application. For example:
* `tapply()`: This function applies a function to a vector based on a grouping variable, and returns a list with the results.
* `vapply()`: This function is similar to `sapply()`, but it allows you to specify the type and length of the output in advance.
* `rapply()`: This function is similar to `lapply()`, but it recursively applies a function to all elements of a list, including nested lists.
* `eapply()`: This function is similar to `lapply()`, but it allows you to apply a function to the elements of an environment.

To sum up, the `apply()` family of functions in R is a set of functions that can be used to apply a function to a dataset in a variety of ways. These functions can be very useful for summarizing and manipulating data, and they can save you time and effort by allowing you to apply a function to an entire dataset rather than writing a loop to apply the function to each element individually. The functions you have met today can be used in a variety of situations to summarize and manipulate data, and they can be combined with other functions and tools in R to perform more complex analyses.