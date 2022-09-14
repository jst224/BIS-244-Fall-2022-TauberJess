getwd()
library(here)
library(tidyverse)
us_states <- read_csv(here("covid-19-data","us-states.csv"))
View(us_states)

options(max.print=999999)

# Observations in PA only

state<-"Pennsylvania"

PENNSYLVANIA <-filter(us_states,state=="Pennsylvania")


View(PENNSYLVANIA)


n <-length(PENNSYLVANIA$date)

#CHANGES in the cases and deaths variables

PENNSYLVANIA$incr_cases <-3

PENNSYLVANIA$incr_deaths <-1


for (i in 2:n)
{PENNSYLVANIA$incr_cases[i] <- (PENNSYLVANIA$cases[i]-PENNSYLVANIA$cases[i-1])}

for (i in 2:n) 
{PENNSYLVANIA$incr_deaths[i] <- (PENNSYLVANIA$deaths[i]-PENNSYLVANIA$deaths[i-1])}

#checksum of all the incr_cases in PA

sd(PENNSYLVANIA$incr_cases)