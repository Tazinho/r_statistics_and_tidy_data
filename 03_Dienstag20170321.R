#   ____________________________________________________________________________
#   Setup
rm(list = ls(all = TRUE))
#   ____________________________________________________________________________
#   Packages
library(sjmisc)
library(dplyr)
library(tibble)
library(broom)
#   ____________________________________________________________________________
#   Example dplyr::select
data(efc)
dim(efc)
efc <- as_tibble(efc)
select(efc, contains("cop")) 
#   ____________________________________________________________________________
#   Loading some data from Daniels package to train select and table
dir("data/input")
ls()
class(ess)

laender <- select(ess, country)
str(laender)
table(laender)
frq(laender)
laender %>% group_by(country) %>% count

table(ess %>% select(gndr))
ess %>% select(gndr) %>% str
table(ess[,"gndr"])

ess %>% mutate(gndr = if_else(gndr == 1, "m", "f")) %>% 
  select(gndr, country) %>% table %>% tidy

ess %>% mutate(gndr = if_else(gndr == 1, "m", "f")) %>% 
  select(gndr, country) %>% flat_table

head(mtcars)
#   ____________________________________________________________________________
#   Example dplyr::filter and slice
filter(efc, e42dep == "moderately")
efc3 <- efc %>% select(e42dep) %>% unique
to_label(efc3, "e42dep")

efc <- efc %>% mutate(e42dep = to_label(e42dep))

?to_label

summary(efc["e42dep"])

efc["e42dep"]
head(efc)
View(efc)

?slice

library(forcats)
ess$gndr

ess$gndr
factor(letters)
?factor

ess4 <- ess %>% slice(1:10) %>% select(gndr) %>% 
  group_by(gndr) %>% count(gndr) %>% arrange(n)
ess4
levels(ess4$gndr)
labels(ess4$gndr)
attributes(ess4$gndr)

str(ess$gndr)
ess$gndr[labels()]

ess$gndr(names(attr(ess4[["gndr"]], "labels")))


lookup <- names(attr(ess4[["gndr"]], "labels"))
lookup
levels(ess4[["gndr"]])

gndr_labs <- attr(ess[, "gndr"] %>% .[["gndr"]], "labels")
gndr_lookup <- gndr_labs[as.integer(ess[["gndr"]])]
names(gndr_lookup)

load(file = "data/input/ESS.RData")
ess <- ess %>% mutate(gndr = to_label(gndr)) %>% select(gndr)

ess$gndr <- to_label(ess$gndr)

ess %>% select(gndr)
?to_label

table(ess$gndr)
str(ess$gndr)

ess %>% to_label(gndr) %>% select(gndr)

efc %>% 
  rec(c82cop1, c83cop2, recodes = "1,2=0; 3:4=2")


efc %>% 
  rec(c82cop1, c83cop2, recodes = "1,2=0; 3:4=2")


