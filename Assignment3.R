library(tidyverse)
library(here)
getwd()
        US2020 <- read_csv(here("covid-19-data", "us-counties-2020.csv"))
      US2021 <- read_csv(here ("covid-19-data", "us-counties-2021.csv"))
      US2022 <- read_csv(here ("covid-19-data", "us-counties-2022.csv"))
      USRECENT <- read_csv(here ("covid-19-data", "us-counties-recent.csv"))
      USLIVE <- read_csv(here ("covid-19-data","live", "us-counties.csv"))
      COMBINE <- rbind(US2020, US2021, US2022, USRECENT, USLIVE)
      
      #use filter
      
      PACounty <- filter(COMBINE, state == "Pennsylvania")
      Lehigh <- filter(PACounty, county=="Lehigh")
      
      #remove row with the same dates
      
      LehighCases <- distinct(Lehigh, date, .keep_all = TRUE)
      
      #calculate new case amount for each date
      
      n <- length(LehighCases$date)
      LehighCases$increase_cases <- 0 
      
      # use for loop
      
      for (i in 2: n)
      {
        LehighCases$increase_cases[i]<- (LehighCases$cases[i]-LehighCases$cases[i-1])
      }
      view(LehighCases)
      
      # graph data
      
      p <- ggplot(data = LehighCases)
      
      p + geom_line(color="blue", mapping =aes(x=date, 
                                               y=increase_cases),
                    group=1)+ 
        labs(x = "Date", y = "Increased COVID Cases", title = "COVID-19 Cases In Lehigh, PA")
      
      view(p)