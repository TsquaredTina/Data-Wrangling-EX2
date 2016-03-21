library(tidyr)
library(dplyr)

setwd("C://Users//Tina Teng//Documents//Personal//Springboard - Foundation of Data Science//3.1 EX2")

titanic <- read.csv(file="titanic_original.csv", head=TRUE, sep =",")

#1: Port of embarkation

for (i in 1:length(titanic$embarked))
{ titanic$embarked[match("", titanic$embarked)] <- "S"}

#2: Age
titanic$age[is.na(titanic$age)] <- mean(titanic$age, na.rm=TRUE)

#3: Lifeboat
for (i in 1:length(titanic$boat))
{ titanic$boat[match("", titanic$boat)] <- "NA"}

#4: Cabin
titanic$has_cabin_number <- ifelse(match(titanic$cabin,""), 0, 1)
titanic$has_cabin_number[is.na(titanic$has_cabin_number)] <- 1

#5: Submit the project on Github
write.table(titanic, file = "titanic_clean.csv", append = FALSE, quote = TRUE,
            sep = ",", col.names = TRUE, row.names = FALSE)

