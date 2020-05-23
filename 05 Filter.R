# Install the required packages in R console with:
# install.packages("tidyverse")
# suppressPackageStartupMessages is needed to supress warnings
# when we import the libraries
suppressPackageStartupMessages(library("tidyverse"))
# Importing the sleep dataset
# from the tidyverse's library
mydata <- msleep
# Printing the first rows of the dataset 
head(mydata)
# Only for a better output
cat("\n///////////////////////////////////////////////\n\n")
# Assigning to mydata1 the modified dataset
mydata1 <- mydata %>%
# Selecting the desired attributes
select(name, sleep_total, order) %>%
# Filter function
# ! means the opposite of the condition
# == filter with a single value
# , means and
filter(!sleep_total > 18, order == "Primates")
# Printing the first rows of the modified dataset
head(mydata1)
# Only for a better output
cat("\n///////////////////////////////////////////////\n\n")
# Assigning to mydata1 the modified dataset
mydata1 <- mydata %>%
# Selecting the desired attributes
select(name, sleep_total, order, bodywt) %>%
# Filter function
# between filter the values between a range
# | means or
# , means and
# near filter near a value and its assigned tolerance
filter(between(sleep_total, 13, 17) | order == "Primates", near (bodywt, 1, tol = 0.5))
# Printing the first rows of the modified dataset
head(mydata1)