library(sjstats)
library(dplyr)
data(efc)

copeindex <- select(efc, c82cop1:c90cop9)

efc_cope <- mutate(efc,
                   cope_sum = rowSums(copeindex, na.rm = TRUE),
                   cope_avg = rowMeans(copeindex, na.rm = TRUE),
                   cope_avg = mean_n(copeindex, n = 8)
                   )
efc_cope2 <- mutate(efc, 
                    cope_sum = purrr::invoke_rows(.f = mean, .d = efc, .to = "bla") %>%
                      select(bla))
