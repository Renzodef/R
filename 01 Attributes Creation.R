# Install the required packages in R console with:
# install.packages("tidyverse")
# suppressPackageStartupMessages is needed to supress warnings
# when we import the libraries
suppressPackageStartupMessages(library("plyr"))
suppressPackageStartupMessages(library("tidyverse"))
# Importing the .csv file
# that should be in the same directory of this file
mydata <- read.csv("People.csv")
# Printing the first rows of the dataset
head(mydata)
# Printing the first rows of the dataset
cat("\n///////////////////////////////////////////////\n\n")
# Printing informations about the attributes
str(mydata)
# Only for a better output
cat("\n///////////////////////////////////////////////\n\n")
# Editing the values in the "Sex" column
mydata$Sex <- revalue(mydata$Sex, c("       M" = "Male"))
mydata$Sex <- revalue(mydata$Sex, c("       F" = "Female"))
mydata %>%
# Selecting the desired attributes
select(Sex, Age, Height, Weight) %>%
# Trasforming inches in centimeters
mutate(Height = (Height * 2.54) / 100) %>%
# Transforming lb in kg
mutate(Weight = Weight * 0.454) %>%
# Creating the attribute "BMI"
mutate(BMI = Weight / Height ^ 2) %>%
# Grouping by "Sex"
group_by(Sex) %>%
# Summarising the Average BMI for males and females
summarise(Avg_BMI = mean(BMI))