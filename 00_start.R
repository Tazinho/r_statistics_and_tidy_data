alter <- c(33,31,37,28,35,52,31,33,
           32,25,40,27,31,46)
geschlecht <- c("w",
                "m",
                "w",
                "w",
                "w",
                "m",
                "w",
                "w",
                "m",
                "w",
                "w",
                "w",
                "m",
                "m")
tapply(alter, geschlecht, mean)
mean(alter[geschlecht == "m"])
mean(alter[geschlecht == "w"])

table(geschlecht, alter)
table(alter, geschlecht)
table(geschlecht)
table(alter)
sjmisc::frq(alter)
sjPlot::sjt.frq(alter)
sjPlot::sjp.frq(alter)
sjPlot::sjp.frq(geschlecht)
sjPlot::sjt.frq(factor(geschlecht))
