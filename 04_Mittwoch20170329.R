library(sjstats)
library(dplyr)
data(efc)
load(file = "data/input/ESS.RData")

copeindex <- select(efc, c82cop1:c90cop9)

efc_cope <- mutate(efc,
                   cope_sum = rowSums(copeindex, na.rm = TRUE),
                   cope_avg = rowMeans(copeindex, na.rm = TRUE),
                   cope_avg = mean_n(copeindex, n = 8)
                   )

# Anzahl unterschiedlicher Länder = country
# Mittelwert happiness
# Proportion an Frauen

names(ess)
summarise(ess,
          nd_country = n_distinct(country, na.rm = TRUE),
          m_happy = mean(happy, na.rm = TRUE),
          m_gender = mean(gndr == 2, na.rm = TRUE))


#   ____________________________________________________________________________
dat <- select(mtcars, mpg, gear)
dat <- group_by(dat, gear)
summarise(dat, n = n())

ess_klein <- ess %>% select(country, gndr, health)
sample_n(ess_klein, 5)

ess_kg <- ess_klein %>% group_by(country) %>% 
  sample_n(5)
ess_kg

ess %>% select(gndr, country, happy) %>% group_by(country) %>% 
  summarise(m_happy = mean(happy, na.rm = TRUE),
            m_female = mean(gndr == 2, na.rm = TRUE))
iris %>% group_by(Species) %>% attributes
iris %>% group_by(Species) %>% ungroup %>% class


iris %>% group_by(Species) %>% mutate(n = n()) %>% ungroup
#   ____________________________________________________________________________
#   bind_cols bind_rows
d1 <- select(mtcars, mpg, cyl) %>% slice(1:4)

d2 <- select(mtcars, mpg, cyl) %>% slice(11:14)

d3 <- select(mtcars, mpg, gear) %>% slice(1:4)

bind_cols(d1, d2)
bind_rows(d1, d2)

bind_cols(d1, d3)
bind_rows(d1, d3)
#   ____________________________________________________________________________
#   joins
d1 <- select(ess, gndr, happy, agea) %>% slice(1:7)
d2 <- select(ess, agea, stfhlth) %>% slice(11:14)

left_join(d1, d2)

d1$id <- 1:nrow(d1)
d2$id <- 1:nrow(d2)

left_join(d1, d2)
left_join(d1, d2, by = "id")
