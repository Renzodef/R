# Install the required packages in R console with:
# install.packages("tidyverse")
# suppressPackageStartupMessages is needed to supress warnings
# when we import the libraries
suppressPackageStartupMessages(library("tidyverse"))
# Importing the starwars dataset
# from the tidyverse's library
sw <- starwars
# Printing the first rows of the dataset 
head(sw)
# Only for a better output
cat("\n///////////////////////////////////////////////\n\n")
# Assigning to sw1 the modified dataset
sw1 <- sw %>%
# Selecting only the desired attributes
select(name, height, mass, gender) %>%
# Renaming the attribute mass in weight
rename(weight = mass) %>%
# Deleting the rows with missing values
na.omit() %>%
# Dividing all the values of column "Height" by 100
mutate(height = height / 100) %>%
# Selecting only the rows that have male or female as gender,
# in this way we will delete the rows with gender hermaprhodite
filter(gender %in% c("male", "female")) %>%
# Editing the values in the column genderM
# male in m and female in f
mutate(gender = recode(gender, male = "m", female = "f")) %>%
# This mutate will return a vector of TRUE and FALSE
# TRUE when we respect the condition
mutate(size = height > 1 & weight > 75,
# When size is TRUE, the value of size will be transformed in big,
# else it will became small
       size = if_else(size == TRUE, "big", "small"))
# Printing the first rows of the modified dataset
head(sw1)