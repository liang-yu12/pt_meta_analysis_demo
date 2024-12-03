# 0. Install meta package:
install.packages("meta")  # “” is necessary

# load a package:
library(meta) 

# Example 1:  ------------------------

# 1. Read in the data: 

fuccio <- read.csv("example_data.csv")

View(fuccio) # take a look 

# 2.1 Pool studies: inverse variance method
fuccio.iv <- metabin(txcase, txtotal, cncase, cntotal,
                     studlab = study, 
                     method = "Inverse", sm="RR", 
                     data = fuccio)
# look at the results: 
summary(fuccio.iv)
# Forest plot:
forest(fuccio.iv)
# Funnel plot
funnel(fuccio.iv)

# 2.2 Pool studies using MH method
fuccio.MH <- metabin(txcase,txtotal,cncase,cntotal,studlab=study,
                     method="MH",sm="RR",data=fuccio)
summary(fuccio.MH)
forest(fuccio.MH)

# 2.3 Pool studies using DerSimonian-Laird method (random effectr)
fuccio.DL <- metabin(txcase,txtotal,cncase,cntotal,studlab=study,
                     method="Inverse",sm="RR",method.tau = "DL", data=fuccio)
fuccio.DL
forest(fuccio.DL)

