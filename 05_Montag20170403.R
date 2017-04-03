#   ____________________________________________________________________________
#   introduce pipe
library(dplyr)

mtcars %>% select(mpg, gear) %>% 
  filter(mpg > 20) %>% 
  group_by(gear) %>% 
  summarise(n())

#   ____________________________________________________________________________
#   rewrite with pipe...
load("data//input//ESS.RData")
ess_klein <- ess %>% select(country, gndr, health) %>% 
  group_by(country) %>% 
  sample_n(5)
ess_klein
#   ____________________________________________________________________________
#   Lese SPSS Daten ein
# ("data//input//stigma_170330.sav")
#   ____________________________________________________________________________
#   some commands from Daniel's packages
library(sjPlot)
library(sjmisc)
stigma <- read_spss("data//input//stigma_170330.sav")

descr(stigma, max.length = 15)
sjt.df(stigma)
view_df(stigma)

find_var(stigma, "bildung", as.varlab = TRUE, as.df = TRUE)
# find_var(stigma, "euro", search = "euro", as.varlab = TRUE)
sjt.frq(stigma)
sjt.frq(stigma, auto.group = 10)
sjt.frq(stigma$q101, auto.group = 10)
