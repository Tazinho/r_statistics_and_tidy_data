rm(list = ls(all = TRUE))


head(mtcars,20)
mtcars[["mpg"]]
mtcars[, c("cyl","gear")]
rownames(mtcars)
mtcars[grep("Merc", rownames(mtcars)),]
# install.packages("tibble")
library(tibble)
mydf <- data.frame(farben = c("rot", "grün", "blau", NA, NA),
                   zahlen = 1:5)
str(mydf)
mytb <- tibble(farben = c("rot", "grün", "blau", NA, NA),
               zahlen = 1:5,
               diskret = factor(c("a", "b", "c", "d", "e")))

# Subsetting Unterschiede zwischen data.frame und tibble
mydf$zahlen
mytb$zahlen

mydf[, "zahlen"]
mytb[, "zahlen"]

mydf[,2]
mytb[,2]

mydf[["zahlen"]]
mytb[["zahlen"]]

mydf[[2]]
mytb[[2]]

# Listen Unterschiede zwischen Subsetting mit `[` und `[[`
liste <- list(c(1,2,3),
              list(c(3,2,5), c("a","b")),
              c(9,9,9))
str(liste)
liste[1]
liste[[1]]
liste[2]
liste[[2]]
liste[[2]][1]
liste[[2]][[1]]

head(mtcars)
# ?mtcars
library(broom)
fit <- lm(mpg ~ hp + wt, data = mtcars)
fit
str(fit)
fit[1]
tidy(lm(fit))
augment(lm(fit))
glance(lm(fit))

# finde R^2
zusammenfassung <- summary(fit)
str(zusammenfassung)
names(fit)


# Schreibe Funtion zur Zurückgabe von R^2
r_squared <- function(fit){
  stopifnot(class(fit) == "lm")
  summary(fit)[["r.squared"]]}
r_squared(fit)
