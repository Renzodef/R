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
# Only for a better output
cat("\n///////////////////////////////////////////////\n\n")
# Assigning to mydata1 the modified dataset
mydata1 <- mydata %>%
# Rearranging the attributes
select(Height, Weight, Sex, Name) %>%
# Renaming the attributes
# The first name is the one we will have in output
# The second is the one we want to edit
rename(Nome = Name, Genere = Sex, Altezza = Height, Peso = Weight)
# Printing the first rows of the modified dataset
head(mydata1)