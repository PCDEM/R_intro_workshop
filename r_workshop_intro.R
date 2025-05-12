#'******R for Beginners Workshop******

#'This script is a part of the R Beginners Workshop. You can either follow along
#'with this script, or make a new script and type along as the workshop progresses.


# Running code------------------------------------------------------------------

# You can run a line of code by placing the cursor before the line or anywhere
# in the line and pressing 'Ctrl + Enter' (Windows) or 'Cmd + Enter' (Mac).
500

# You can also highlight a block of code and run it all at once. 
100
200
300


# Setting Working Directory-----------------------------------------------------

# Get the working directory (folder where R looks for and saves files to)
getwd()

# Set the working directory to the folder where your files are
setwd("C:/path/to/your/folder")


# Installing and Loading Packages-----------------------------------------------

# R has a large number of packages that can be used to extend its functionality.
# You can install packages from CRAN (Comprehensive R Archive Network) using the
# 'install.packages()' function. You only need to install a package once, but you
# need to load it every time you start a new R session using the 'library()' function.

# Install a package
install.packages('ggplot2')

# Load a package
library(ggplot2)


# Basic math--------------------------------------------------------------------

5 + 5  # Addition
5 - 5  # Subtraction
5 * 5  # Multiplication
5 / 5  # Division
5 ^ 5  # Exponentiation (or **)
log(100) # Natural log
10*10/(3^4*2)-2 # PEMDAS

# R follows the basic order of operations (PEMDAS), so be sure to use parentheses
# where necessary.

# Notice the matching parentheses are highlighted when your cursor moves over one:
#(((())))

# Logicals and Booleans-------------------------------------------------------

# R has several built-in logical operators that can be used to compare values.
# Some of the logical operators and booleans are:
# x < y  # Less than
# x > y # Greater than
# == # Equal to
# x <= y # Less than or equal to
# x >= y # Greater than or equal to
# x != y # Not equal to
# x | y # Or
# x & y # And
# x %in% y # Is in
# is.na(x) # Is missing
# !is.na(x) # Is not missing

1 > 2  # returns FALSE
1 < 2  # returns TRUE
1 == 2 # returns FALSE
1 != 2 # returns TRUE
1 < 2 | 3 > 4 # returns TRUE; only one test needs to be true to return TRUE
1 < 2 & 3 > 4 # returns FALSE; both tests need to be true to return TRUE


# Watch for how you set the precedence of the logical operators and booleans

1 > 0.5 & 2 # This returns TRUE because R coerces 2 to be a logical (TRUE)
as.logical(2) # returns TRUE; all non-zero numbers are TRUE and 0 is FALSE
1 > 0.5 & 1 > 2 # returns FALSE; need to be explicit about both tests


# Assigning variables-----------------------------------------------------------

# Use the assignment operator '<-' to assign a value to an object
x <- "Hello, World!"
# Call the object 'x' to see the value
x 

# When you call 'x' notice that "Hello, World!" is printed to the console.
# You can also use the '=' sign to assign a value to an object but it is not
# recommended. Using the '<-' operator is considered a best practice for R coding.

# If you check in the Environment tab in RStudio, you will see that 'x' is now an 
# object with the value "Hello, World!".


# Naming variables--------------------------------------------------------------

# Variable names can contain letters, numbers, and underscores but cannot start
# with a number. Variable names are case-sensitive, so 'x' and 'X' are different.
# There are some naming conventions to keep in mind when naming variables:

# 1) Use descriptive names for objects and functions
# 2) Use camelCase or snake_case for naming objects and functions
# 3) Keep names short but descriptive
# 4) Avoid using special characters (e.g. $, %, &, etc.) in variable names
# 5) Don't start variable names with a number

# Good examples:
avgTemp <- 75
avg_temp <- 75

# Bad examples:
avarageTemperature1_2 <- 75 # misspelled "average" and too long
avge.T <- 75 # Not descriptive enough
1stAvgTemp <- 75 # variable name cannot start with a number
avgTemp% <- 75 # variable name cannot contain special characters

# These naming conventions aren't required but you should be consistent when naming
# functions and objects within a project to help keep your code organized.

# Some variable names are reserved for R functions and cannot be used as variable names.
# if
# else
# while
# function
# for
# TRUE
# FALSE
# NULL
# Inf
# NaN
# NA


# Functions---------------------------------------------------------------------

# Functions are blocks of code that perform a specific task. You can create your
# own functions or use built-in functions. Functions can take arguments (inputs)
# and return values (outputs). 

# Return the mean value of the numbers 1-10
mean(x = 1:10)

# Return the minimum value of the numbers 1-10
min(x = 1:10)

# Return the standard deviation of the numbers 1-10
sd(1:10) # note that the argument is not named in this case

# If you want to read documentation about a function, you can use the '?' operator
# with the function name. The function documentation will appear in the 'Help' tab
# in RStudio.
?mean


# Objects-----------------------------------------------------------------------

# Objects are the basic building blocks of R. Everything in R is an object, including
# functions, data frames, and vectors. You can create objects using the assignment
# operator '<-'.

# Create a numeric vector object
e <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# Hand calculate the mean
sum(e) / length(e)

# R functions to calculate the mean
mean(e) 

# Make a dataframe object
e <- data.frame(x = 1:5,
                y = 11:15)
e

# Get the mean of the y column
mean(y)

# Notice that the previous line returns an error: "object 'y' not found". This is
# because it is not in the global environment. You need to use the '$' operator 
# to access the y column in the dataframe.
mean(e$y)

# R will look for named objects in the environment, since 'y' wasn't in the 
# environment, it gave up and returned an error.

 
# Vectors-----------------------------------------------------------------------

# Vectors are one-dimensional arrays that can hold numeric, character, or logical
# data. You can create a vector using the 'c()' function.

# Numeric vector
myVec <- 1:10

# Check to see if my_vec is a vector
is.vector(myVec)

# Character vector
chrVec <- c('1','2','3','4','5')

# Check to see if chr_vec is a vector
is.vector(chrVec)

# Both vectors contain the same values but the first vector is numeric and the
# second vector is character. You can check the class of an object using the
# 'class()' function.
class(myVec)
class(chrVec)

# Notice the difference in the class of the two vectors. myVec is of class
# 'numeric' and chrVec is of class 'character'.

# A vector can also be a list of objects of varying classes and lengths. 

# Make a list of different objects
myList <- list(a = 1:4, b = "Hello, World!", c = data.frame(x = 1:5, y = 11:15))
myList

# Check if myList is a vector and a list
is.vector(myList) # returns TRUE
is.list(myList) # returns TRUE


# Indexing Vectors--------------------------------------------------------------

# You can access elements of a vector using the square brackets '[]' and the index
# of the element you want to access. R uses 1-based indexing, so the first element
# of a vector is at index 1.

# Create vector of random numbers
vec <- rnorm(n = 10, mean = 30, sd = 10)
vec

# Get the first element of the vector
vec[1]

# Get the first 5 elements of the vector
vec[1:5]

# Get the first, third, and fifth elements of the vector
vec[c(1, 3, 5)]

# Return all values EXCEPT the first thrid and fifth elements
vec[-c(1, 3, 5)]

# Return all values greate than 30
vec[vec > 30]


# Indexing Lists----------------------------------------------------------------

# You can access elements of a list using the double square brackets '[[]]' and
# the index of the element you want to access. You can also use the '$' operator
# to access elements of a list by name.

# Create a list of different objects
myList <- list(num = 1:5, name = c('Joe', 'Bob', 'Mary'))

# Return the first vector in the list
myList[[1]]

# Return the first element of the second vector in the list
myList[[2]][1]

# Return the first vector in the list using the '$' operator
myList$num

# Return the first element of the second vector in the list using the '$' operator
myList$name[1]


# Your Turn---------------------------------------------------------------------

# 1) Install and load the packages tidyverse, psych, and palmerpenguins using the 
#    install.packages() and library() functions.

# 2) Make a vector of 100 random values using the rnorm() function and name it vec
#    (hint: use ?rnorm to read the argument descriptions).

# 3) Get summary statistics for the vector using the describe() function.

# 4) Use [] indecing to return the first 10 values of the vector.

# 5) Plot your data using the plot() function. 



# Tidyverse---------------------------------------------------------------------

# The Tidyverse is a collection of R packages that share a common philosophy and
# are designed to work together. The Tidyverse includes packages like dplyr, ggplot2,
# tidyr, and readr. Piping is a key feature of the Tidyverse and allows you to
# chain functions together using the '%>%' operator. 

install.packages('tidyverse')
library(tidyverse)

# Notice the conflicts when you load the tidyverse. 

# ── Conflicts ─────────────────────────────────────────── tidyverse_conflicts()
# ✖ dplyr::filter() masks stats::filter()
# ✖ dplyr::lag()    masks stats::lag()

# This is because the Tidyverse packages have functions with the same name as base
# R functions. If you wanted to use a base R function, you would need to specify
# the package name before the function name using '::' (e.g. stats::filter()).


# Now that you have loaded the Tidyverse, you can use the piping operator ('%>%') 
# to chain functions together instead of nesting them.


# If you wanted to get the average pH for each site when the pH is greater than 6.
summarise(group_by(filter(dat, pH > 6), Site), mean(pH, na.rm = TRUE))


# Getting the same data using the piping operator makes the code much easier to read.
dat %>%
  filter(pH > 6) %>% 
  group_by(Site) %>%
  summarise(mean(pH, na.rm = TRUE))


# Data Wrangling---------------------------------------------------------------

# Data wrangling is the process of cleaning and transforming data to make it more
# suitable for analysis. The ecosystem of Tidyverse packages makes data wrangling
# in R much easier.

# Start by inspecting the data to see what needs to be cleaned.
View(dat)

# Use tidyverse syntax to clean the data into these specifications:
# 1) Make a column for total nitrogen (TN) by combing and then removing the TKN 
#    and NOX columns, 
# 2) Remove ANY row that has a column with missing data
# 3) Make sure each site has only one observation per date
# 4) Site names are in 'XX-XX' format, get the median value based on the identifier 
#    to the left of the '-'.
# 5) Convert date to 'mm/dd/yyyy' format

dat %>%
  mutate(TN = TKN + NOX,
         Site = substr(Site,1,2)) %>%
  select(-c(TKN, NOX)) %>%
  drop_na() %>%
  group_by(Site, Date) %>%
  summarise(across(where(is.numeric), \(x) median(x))) %>%
  mutate(Date = format(Date, '%m/%d/%Y'))






# R Coding Best Practices-------------------------------------------------------

# 1) Break code into sections (not necessary but helpful to keep code organized)

# 2) Put all library() calls at the beginning of each section

# 3) Use comments to explain WHY the code is doing what it is doing rather than
#    WHAT the code is doing (unless it is a complex chunk of code)

# 4) Keep naming conventions consistent throughout the script. The best naming
#    conventions are:
#       - Use descriptive names for objects and functions
#       - Use camelCase or snake_case for naming objects and functions
# 
#       avgTemp <- 75 #Good
#       avg_temp <- 75 #Good
#       At1_2  <- 75 #Bad

# 5) Use the '<-' operator for assignment rather than '='

# 6) Keep lines of code to a maximum of 80 characters (use the line in RStudio)

# These are just a few best practices to keep in mind when writing R code. They
# are guidelines that are optional to implement but will help to keep your code
# organized, clean-looking, and readable which will help you in the long run if
# you return to the code at a later date.




