
library(tidyverse)
library(magrittr)
library(tidyr)
library(readr)
library(dplyr)
library(magrittr)
library(openxlsx)


  country <- c("Argentina", "Australia", "Brazil", "Canada", "Chile", "Germany", "European Union", "France", "United Kingdom",
               "Indonesia", "India", "Italy","Japan", "Korea, Rep.", "Mexico", "Russian Federation", "Saudi Arabia","Turkey",
               "United States", "South Africa") 
  country
  
  year <- c(1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
            2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012,
            2013, 2014, 2015, 2016, 2017, 2018) 
  year
  
  
  dados_pop <- dados_pop %>%
    select(contry_name = "Country Name", "1990":"2018") %>%
    filter(contry_name %in% country)
  
  
  dados_GDP <- dados_GDP %>%
    select(contry_name = "Country Name", "1990":"2018") 
  
  
  dados_pop <- dados_pop %>% 
    select(contry_name,"1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001",
           "2002","2003","2004", "2005","2006","2007","2008","2009","2010","2011",
           "2012","2013","2014","2015","2016","2017","2018")%>%
    pivot_longer(cols = "1990":"2018", names_to = "year", values_to = "population")  
  
  
  dados_GDP <- dados_GDP %>% 
    select("contry_name","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001",
           "2002","2003","2004", "2005","2006","2007","2008","2009","2010","2011",
           "2012","2013","2014","2015","2016","2017","2018")%>%
    pivot_longer(cols = "1990":"2018", names_to = "year", values_to = "GDP_constant")

  arrange(dados_GDP)  
  
  GDP_per_pop <- data_frame(dados_GDP, dados_pop$population)
  GDP_per_pop <- rename(GDP_per_pop, "population" = "dados_pop$population")  
  GDP_per_pop <- rename(GDP_per_pop, country = "contry_name") 

  GDP_kg_per_pop <- c(GDP_per_pop$GDP_constant  / (GDP_per_pop$population/1000))
  
  GDP_kg_per_pop
  
  GDP_per_pop["GDP_kg_per_pop"]<-(GDP_per_pop$GDP_constant  / (GDP_per_pop$population/1000))
  
  GDP_per_pop <- na.omit(GDP_per_pop)
#////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  arquivoExcel <- 'GDP_per_POP.xlsx'
  
  write.xlsx(GDP_per_pop, arquivoExcel)  
  
  #////////////////////////
  
  write_csv(GDP_per_pop, "GDP_per_POP.csv")
  
  