# Install the required packages in R console with:
# install.packages("tidyverse")
# suppressPackageStartupMessages is needed to supress warnings
# when we import the libraries
suppressPackageStartupMessages(library("tidyverse"))
# Importing the .csv file
# that should be in the same directory of this file
mydata <- read.csv("People.csv")
# Printing the first rows of the dataset
head(mydata)
# Printing the first rows of the dataset
cat("\n///////////////////////////////////////////////\n\n")
# Transforming inches in meters
mydata$Height <- (mydata$Height) * 2.54
# Trasforming the values in integers
mydata$Height <- as.integer(mydata$Height)
# Trasforming values of column "Height" with some conditions
mydata$Height <- case_when(
mydata$Height <= 165 ~ "Short",
mydata$Height > 165 & mydata$Height < 180 ~ "Medium",
mydata$Height >= 180 ~ "Tall"
)
# Trasforming the values in ordinal attributes
mydata$Height <- as.factor(mydata$Height)
# Priting the order of the factors of the column "Height"
levels(mydata$Height)
# Only for a better ouput
cat("\n///////////////////////////////////////////////\n\n")
# Reordering the factors
mydata$Height <- factor(mydata$Height, levels = c("Short", "Medium", "Tall"))
# Printing the new order
levels(mydata$Height)
# Only for a better output
cat("\n///////////////////////////////////////////////\n\n")
# Printing only the desired attributes
mydata %>%
select(Name, Sex, Height)