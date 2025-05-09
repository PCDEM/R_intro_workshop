#'******R Beginners Workshop: Basic R Syntax******

#'This script is a part of the R Beginners Workshop and covers some of the basic
#'syntax of R. This won't cover everything but will give you a good foundation
#'to build on.

# Running code------------------------------------------------------------------

# You can run a line of code by placing the cursor before the line or anywhere
# in the line and pressing 'Ctrl + Enter' (Windows) or 'Cmd + Enter' (Mac).
500

# You can also highlight a block of code and run it all at once. 
100
200
300




# Basic math--------------------------------------------------------------

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

5 > 1  # Greater than; returns TRUE
5 < 1  # Less than; returns FALSE
5 >= 5 # Greater than or equal to; returns TRUE
5 <= 5 # Less than or equal to; returns TRUE
5 == 5 # Equal to; returns TRUE
5 != 5 # Not equal to; returns FALSE


# Assigning variables-----------------------------------------------------------

# Use the assignment operator '<-' to assign a value to an object
x <- "Hello, World!"
x

# When you call 'x' notice that "Hello, World!" is printed to the console.
# You can also use the '=' sign to assign a value to an object but it is not
# recommended. Using the '<-' operator is considered a best practice for R coding.

# You can do multiple assignments at once
x <- y <- z <- 5






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
At1_2  <- 75
1stAvgTemp <- 75 # won't work
avgTemp% <- 75 # won't work
avge.T <- 75

# These naming conventions aren't required but you should be consistent when naming
# functions and objects within a project to help keep your code organized.






# Vectors-----------------------------------------------------------------------

# Vectors are one-dimensional arrays that can hold numeric, character, or logical
# data. You can create a vector using the 'c()' function.

# Numeric vector
numVec <- c(1, 2, 3, 4, 5)
numVec

# Character vector
chrVec <- c('1','2','3','4','5')
chrVec

# Both vectors contain the same values but the first vector is numeric and the
# second vector is character. You can check the class of an object using the
# 'class()' function.
class(numVec)
class(chrVec)

# Notice the difference in the class of the two vectors. numVec is of class
# 'numeric' and chrVec is of class 'character'.







# Functions---------------------------------------------------------------------

# Functions are blocks of code that perform a specific task. You can create your
# own functions or use built-in functions.

max(numVec) 
min(numVec)
mean(numVec)
sum(numVec)

# You can also create your own functions, but chances are someone may have already
# created a function that does what you need. 

# You can get information about a function by using the '?' operator with the 
# function name. The function documentation will appear in the 'Help' tab in RStudio.
?mean







# Data Frames-------------------------------------------------------------------

# Data frames are two-dimensional arrays that can hold multiple types of data 
# and are a common data structure in R. You can create a data frame using the
# 'data.frame()' function.

df <- data.frame(
  Name = c('Dave', 'Mary', 'George'),
  Age = c(25, 30, 35),
  Married = c(TRUE, FALSE, TRUE)
)
df






# Importing Data----------------------------------------------------------------

# There are several functions in R that allow you to import data from various
# file formats. The most common functions are 'read.csv()' and 'read_excel()'.
# While 'read.csv()' is a base R function, 'read_excel()' is part of the 'readxl'
# package. You will to install this package before using the 'read_excel()' function.

install.packages('readxl')
library(readxl)

# Now you can use the 'read_excel()' function to import data from an Excel file.

dat <- read_excel('data/water_quality_data.xlsx')

# Use the 'head()' function to view the first few rows of the data.
head(dat)







# Inspecting data---------------------------------------------------------------

# There are several functions in R that allow you to inspect the shape, structure,
# and summary of the data within the dataframe.

dim(dat)  # Dimensions of the data frame
str(dat)  # Structure of the data frame
summary(dat)  # Summary of the data frame







# Subsetting data---------------------------------------------------------------

# You can subset data in R using the '[]' operator. You can subset data by row,
# column, or both.

dat[1,]  # First row
dat[,1]  # First column
dat[1:5, 1:3]  # First five rows and first three columns

# If you know the name of the column you want to subset, you can use the '$'
# operator to return a vecotr of the data in that column
dat$Date







# Plotting Data-----------------------------------------------------------------

# R has a built-in plotting system that allows you to create a wide variety of
# plots.

hist(dat$pH) 
boxplot(dat$pH)
plot(dat$Date, dat$pH)

# The ggplot2 package is probably the most popular plotting package in R and allows
# for high level customization of plots.

install.packages('ggplot2')
library(ggplot2)

# Create the ggplot histogram object
p <- ggplot(dat, aes(x = pH)) + 
  geom_histogram()
p

# Add elements to the plot
p <- p +
  geom_histogram(fill = 'lightblue', color = 'black') +
  ylab('Frequency') +
  ggtitle('Distribution of pH in Pinellas County Waters') +
  theme_classic() +
  theme(panel.border = element_rect(linetype = "solid", 
                                          colour = "black", 
                                          fill = NA, 
                                          linewidth = 0.5),
        plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 5100)) +
  scale_x_continuous(breaks = seq(5, 10, 1), limits = c(5, 10))
p

# Although this plot looks better when adding custom elements, it is not very 
# informative since this plot has all data points from the dataset. We need to
# filter and wrangle the data a little to get a better understanding of our results.


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


# Loops-------------------------------------------------------------------------

# Loops are used to iterate over a sequence of values and perform a task for each
# value. There are several types of loops in R, but the most common are 'for' and
# 'while' loops.

# For loop
for(i in 1:5) {
  print(i)
}

# You can nest for loops together to perform a task for each value in two sequences.
# Be careful when nesting loops as they can become very slow if you have a large
# dataset. Tidyverse usually has functions that can replace the need for loops.
for (i in 1:5){
  for (j in 1:5){
    print(paste('i:',i,'j:',j))
  }
}

# This allows you to perform a task for each specified value in a condition.
x <- TRUE
num <- 1
while(x) {
  print('Hello, World!')
  num <- num + 1
  if (num > 5) x <- FALSE
}


# Conditional Statements--------------------------------------------------------

# Conditional statements are used to perform different actions based on different
# conditions. The most common conditional statement in R is the 'if' statement.

x <- 5
if (x > 5) {
  print('x is greater than 5')
} else {
  print('x is less than or equal to 5')
}

# You can also use 'else if' to check multiple conditions.
x <- 5
if (x > 5) {
  print('x is greater than 5')
} else if(x == 5) {
  print('x is equal to 5')
} else {
  print('x is less than 5')
}


# Generating Plots With Loops---------------------------------------------------

# You can use loops to generate multiple plots for different subsets of data so
# you don't have to edit and run the same code multiple times

# Here we can create and save a histogram of pH for each site when the site has 
# 120 or more observations:
for (i in unique(dat$Site)){
  
  # Filter the data for each site
  x <- dat %>% 
    filter(Site == i) %>% 
    drop_na(pH)
  
  # If the site has 120 or more observations, create and save the histogram
  if (nrow(x) >= 120 & substring(i,1,1) %in% c('E','W')){
  
    # Save the plot
    png(paste0('loop_plots/pH_hist_', i, '.png'), width = 800, height = 600)
    
    # Create the histogram
    hist(x$pH, main = paste('Distribution of pH at Site', i), xlab = 'pH', 
              col = 'lightblue', border = 'black')
  
    # Close graphics device
    dev.off()
  }
}


# Custom functions--------------------------------------------------------------

# You can create your own functions in R using the 'function()' keyword. You can
# then call the function by its name and pass arguments to it. Functions allow
# you to reuse code and make your scripts more modular.

# This function takes two numbers, adds them together, and returns the result.
add <- function(x, y){
  x + y
}

# Call function name, then pass the arguments. R will interpret the arguments in 
# the same order as they are passed to the function, unless specified.
add(5, 6)


# Generating Plots With Functions-----------------------------------------------

# You can also create a function to generate plots for different subsets of data
# which allows more many plots to be created with less repetition.

# This function takes in a site 
plt_func <- function(site, param, nrows = 120){
  
  # Loop through the site and parameters arguments:
  for (i in site){
    for (j in param){

      # Filter the data for each site:
      x <- dat %>% 
        filter(Site == i) %>% 
        drop_na(j)
      
      # If the site has 120 or more observations, create and save the histogram:
      if (nrow(x) >= nrows & substring(i,1,1) %in% c('E','W')){
        
        # Print a working statement to make sure the function is working:
        cat('\nWorking on plot: ',i,'-',j, '...')
      
        # Save the plot:
        png(paste0('function_plots/', i, '_', j, '.png'), width = 800, height = 600)
        
        # Create the histogram:
        hist(x[[j]], main = paste('Distribution of', j, 'at Site', i), xlab = j, 
                  col = 'lightblue', border = 'black')
      
        # Close graphics device:
        dev.off()
        
        cat('Done!\n')
        
      }
    }
  }
}

# Call the plotting function and define the arguments:
plt_func(
  unique(dat$Site), 
  c('pH','TKN','NOX','TSS'),
  nrows = 130
  )


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




