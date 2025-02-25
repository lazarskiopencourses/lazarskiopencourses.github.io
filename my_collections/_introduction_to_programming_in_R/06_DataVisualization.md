---
title: "Data visualization"
excerpt: "The figure can say the most"
toc: true
toc_sticky: true
---

<script language="javascript" type="text/javascript">
var scrt_name = "/06_DataVisualization"; 
</script>

---
---

# 1. Links to all scripts

## 1.1. Main script

* <a href="{{ site.url }}{{ site.baseurl }}/courses/introduction_to_programming_in_R" onclick="location.href=this.href+scrt_name+scrt_name+'.Rmd'; return false;" download target="_blank">Data manipulation .Rmd</a>

---

## 1.2. Exercises

This time quiz is your task. It can be found on gradescope.

---
---

# 2. Introduction
Data visualization is a powerful tool for understanding and communicating data. It allows us to see patterns, trends, and relationships in the data that may not be immediately apparent by just looking at the raw numbers. Whether you are a data scientist, business analyst, or simply someone who is interested in understanding data, learning how to create effective visualizations is an important skill to have.

But why is data visualization so important? There are several reasons:
* Data visualization makes it easier to understand complex data. With just a quick glance at a well-designed chart or graph, we can quickly grasp the meaning behind large amounts of data and see the bigger picture.
* Data visualization helps us identify patterns and trends. By visualizing data, we can easily see patterns and trends that may not be obvious from looking at raw data. This can help us make better decisions and predictions based on data.
* Data visualization can help us communicate data effectively. Visualizations are a great way to communicate data to others, whether it's through a presentation, a report, or a blog post. Visualizations help make data more accessible and easier to understand for a wider audience.

---
---

# 3. Data
Before we can create any visualizations, we need to have some data to work with. For this tutorial, we will use the `mtcars` dataset that comes built-in with R. This dataset contains information on the performance of different model cars.

To load the mtcars dataset into R, run the following code:
```R
data("mtcars")
```

You can view the first `6` rows of this data by running the following code:
```R
head(mtcars)
```

---
---

# 4. Basic plotting
In base R, there are many functions for creating different types of plots. One of the simplest and most commonly used is the `plot `function.

To create a basic scatterplot in R, use the following code:
```R
plot(x = mtcars$wt, y = mtcars$mpg)
```

This will create a scatterplot with `wt` (car weight) on the x-axis and `mpg` (miles per gallon) on the y-axis.

You can customize the appearance of the plot by adding additional arguments to the plot function. For example, to change the color and size of the points, you can use the following code:
```R
y <- plot(x = mtcars$wt, y = mtcars$mpg, col = "red", pch = 16)
```

You can find a list of all the available plotting symbols and colors by running the `help()` function:
```R
help(plot)
```

In base R, you can create a variety of plots using functions such as plot(), but also other such as `barplot()`, `boxplot()`, `hist()`, and `scatterplot()` and more. These functions allow you to specify the data to be plotted, the aesthetics of the plot such as colors and shapes, and other features such as titles and axis labels.

---
---

# 5. ggplot2
Base R plotting functions can be limited in their flexibility and can be somewhat cumbersome to use for creating more complex or customized plots.

ggplot2 is a data visualization package for R that allows you to create a wide range of static, interactive, and animated plots using a consistent interface. It is built on top of the grid graphics package and implements the grammar of graphics, a general scheme for data visualization which breaks a plot down into its component parts: data, aesthetics, and geometry.

Before we get started with ggplot, make sure you have the package installed and loaded:
```R
install.packages("ggplot2")
library(ggplot2)
```

In ggplot2, a plot is divided into three main components:

* Data: The data that you want to plot. This can be a data frame.
* Aesthetics: The visual mappings between the data and the plot. Aesthetics include things like the `x` and `y` coordinates, the color of the points or bars, and the size of the points.
* Geometry: The visual elements of the plot, such as points, lines, and bars. These are called `geoms` in ggplot.

The ggplot function takes the data and aesthetics as arguments, and the geoms are added to the plot using the `+` operator.

---

## 5.1. Scatterplot
To create a scatterplot, you can use the `geom_point()` function. For example, let's say we want to visualize the relationship between a car's horsepower (`hp`) and its miles per gallon (`mpg`). We'll create a scatterplot using the `ggplot()` function and pass in the data that we want to plot. We'll map the `x` aesthetic to the horsepower variable and the `y` aesthetic to the mpg variable, and use the `geom_point()` function to add points to the plot:
```R
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point()
```

In this case, the `mtcars` data frame is the data, the `x` and `y` aesthetics are mapped to the `hp` and `mpg` variables, respectively, and the `geom_point()` function adds points to the plot (geometry).

---

## 5.2. Line plot
To create a line plot, you can use the `geom_smooth()` function instead of `geom_point()`. Same as above, let's say we want to visualize the change in a car's `mpg` over time as its horsepower increases. We'll create a line plot using the `ggplot()` function and pass in the data that we want to plot. We'll map the `x` aesthetic to the `hp` (horsepower) variable and the `y` aesthetic to the `mpg` variable, and use the `geom_smooth()` function to add a line to the plot:
```R
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_smooth(method = 'lm', se = FALSE)
```

Arguments in `geom_smooth()` - `method` and `se` specify the smoothing method (function) to use and whether to display confidence interval, respectively. In the case of the former, `lm` means fitting linear model. You can find more about these and other arguments by typing `help(geom_smooth)`.

You can also use multiple `geoms` in a single plot to layer different visual elements. For example, we can add points to the line above using the `geom_point()` function:
```R
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)
```

---

## 5.3. Bar plot
To create a bar plot, you can use the `geom_bar()` function. For example, let's say we want to visualize the number of cars in the `mtcars` dataset that have different numbers of cylinders. We'll create a bar plot using the `ggplot()` function and pass in the data that we want to plot. We'll map the `x` aesthetic to the `cyl` variable and use the `geom_bar()` function to add bars to the plot:
```R
ggplot(data = mtcars, aes(x = cyl)) +
  geom_bar()
```

To color the bars in a bar plot in ggplot, you can use the `fill` aesthetic in the `geom_bar()` function. The `fill` aesthetic controls the fill color of the bars in the plot.

```R
ggplot(data = mtcars, aes(x = cyl)) +
  geom_bar(fill = 'gold')
```

The `color`, on the other hand, defines the color with which bars are outlined.
```R
ggplot(data = mtcars, aes(x = cyl)) +
  geom_bar(fill = 'gold', color = 'red')
```

---

## 5.4. Histogram
To create a histogram, you can use the `geom_histogram()` function. For instance, let's say we want to visualize the distribution of horsepower in the mtcars dataset. We'll create a histogram using the `ggplot()` function and pass in the data that we want to plot. We'll map the `x` aesthetic to the `wt` (weight) variable and use the `geom_histogram()` function to add bars to the plot:
```R
ggplot(data = mtcars, aes(x = wt)) +
  geom_histogram()
```

As you can see, the number of bins in a histogram can have a big impact on how the distribution of the data is displayed. Too few bins may result in a plot that is not detailed enough, while too many bins (our case) may make it difficult to see the overall pattern.

One way to choose the number of bins is to use the `bins` argument in the `geom_histogram()` function. For instance, to create a histogram with `10` bins, you can use the following code:
```R
ggplot(data = mtcars, aes(x = wt)) +
  geom_histogram(bins=10)
```

You can also adjust the width of the bins using the `binwidth` argument. 

Keep in mind, however, that the choice of bin size and number is subjective and will depend on the characteristics of your data and the story you want to tell with the plot. It may be helpful to try different bin sizes and numbers and see what works best for your data.

---
---

# 6. More attributes
Many different attributes in ggplot can be used to customize the appearance and formatting of a plot. Some of the most commonly used attributes include:

* `ggtitle()`: adds a title to the plot
* `xlab()` and `ylab()`: adds labels to the x and y axes
* `xlim()` and `ylim()`: sets the limits of the x and y axes
* `scale_x_*()` and `scale_y_*()`: changes the scale of the x and y axes, such as using a logarithmic scale or reversing the scale
* `theme()`: changes various aspects of the plot theme, such as the font, background color, and grid lines
* `labs()`: changes various labels and titles in the plot, such as the legend title or the plot subtitle
* `annotate()`: adds text or graphical annotations to the plot

For instance, the code below creates a scatterplot of the relationship between horsepower (`hp`) and fuel efficiency (`mpg`) in the mtcars dataset, and adds a title, `x` axis label, and `y` axis label to the plot.
```R
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  ggtitle("Fuel Efficiency vs. Horsepower") +
  xlab("Horsepower") +
  ylab("Fuel Efficiency (Miles per Gallon)")
```

---
---

# 7. More dimensions
Adding more dimensions to a plot can help to convey more information and make it easier to understand the relationships between variables. For example, if you are trying to visualize the relationship between two numeric variables, adding a third variable can help to differentiate the points and reveal patterns that might not be apparent in a two-dimensional plot.

For example, let's say we are interested in understanding the relationship between a car's horsepower(`hp`) and its miles per gallon (`mpg`). We might create a scatterplot to visualize this relationship:
```R
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point()
```

This plot shows the general trend that cars with higher `hp` tend to have lower `mpg`, but it does not reveal any other patterns in the data.

However, if we add a third variable, such as the number of cylinders (`cyl`) , we can see that there are different patterns for cars with different numbers of cylinders:
```R
ggplot(data = mtcars, aes(x = hp, y = mpg, color = as.factor(cyl))) +
  geom_point()
```

This plot shows that cars with more cylinders tend to have lower `mpg` at a given horsepower, and that there is lower variation in `mpg` for cars with 6 or 8 cylinders compared to cars with 4 cylinders.

Notice, that if you use a categorical variable as a numeric variable, ggplot will treat it as a continuous variable. For example, if you use the cyl variable in the `aes()` function without converting it to a factor (by `as.factor()` function), ggplot will create a continuous color scale based on the values of `cyl`, rather than treating it as a categorical variable:
```R
ggplot(data = mtcars, aes(x = hp, y = mpg, color = cyl)) +
  geom_point()
```

This is not the clearest representation, as we know that `cyl` has only `3` values(`4`, `6` and `8`)

We can also add a size aesthetic and map it to a continuous variable, such as the weight (`wt`) of the car:
```R
ggplot(data = mtcars, aes(x = hp, y = mpg, color = as.factor(cyl), size = wt)) +
  geom_point()
```

By adding more dimensions to the plot, we can see more detailed patterns in the data and gain a deeper understanding of the relationships between the variables.

---
---

# 8. Summary
Data visualization is a valuable tool for exploring and understanding data. It can help to identify patterns, trends, and relationships in the data, and can make it easier to communicate insights to others.

R has two main approaches to data visualization, which we covered: base R and ggplot. Base R is the built-in graphics system in R and provides a wide range of options for creating plots. ggplot is a powerful and popular data visualization package that provides a consistent interface for creating a wide range of plots and allows for easy customization of the appearance and aesthetics.

Both base R and ggplot have their own strengths and limitations, and the appropriate tool for a given task will depend on the needs and goals of the analysis. It is useful to have knowledge of both approaches and to be able to choose the best tool for a given situation. However, more and more people are switching to ggplot nowadays.

Data visualization is a large and complex topic, and there is always more to learn and explore. With practice and experience, you can continue to improve your skills and create more effective and informative plots.