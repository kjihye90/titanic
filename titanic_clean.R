library(dplyr)
library(tidyr)

titanic_original$embarked[is.na(titanic_original$embarked)]<-"S"

titanic_original$age[is.na(titanic_original$age)]<-mean(titanic_original$age, na.rm = TRUE)

titanic_original$boat[is.na(titanic_original$boat)]<-"None"

titanic_original<-titanic_original %>%
  mutate("has_cabin_number" = ifelse(is.na(titanic_original$cabin), 0, 1))

write.csv(titanic_original, "titanic_clean.csv")