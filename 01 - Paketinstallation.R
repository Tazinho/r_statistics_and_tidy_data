# Dieses Skript installiert jede Menge Pakete und deren Abhängigkeiten.
# Dies kann durchaus einige Minuten dauern, aber die Installation ist einmalig

install.packages(c("reshape", "reshape2", "plyr", "dplyr", "tidyr"), dependencies = TRUE)
install.packages(c("broom", "haven", "readr", "readxl", "lattice"), dependencies = TRUE)
install.packages(c("tibble", "Hmisc", "car", "rms", "lme4"), dependencies = TRUE)
install.packages(c("ggplot2", "grid", "scales", "ggrepel"), dependencies = TRUE)
install.packages(c("magrittr", "purrr", "psych", "stringr", "sjmisc"), dependencies = TRUE)
install.packages(c("effects", "modelr", "forcats", "arm", "sjPlot"), dependencies = TRUE)
install.packages(c("lmtest", "lmerTest", "coin", "pbkrtest", "sandwich", "sjstats"), dependencies = TRUE)
