setwd("C:/Users/queve/Desktop/Computer learning/GIT - Data Science Specialization/Coursera-Data_Science_Specialization/3_Getting_and_cleaning_data")
install.packages("plyr")
install.packages("xlsx")
install.packages("data.table")
library(xlsx)
library(plyr)
library("XML")
library("xpath")
library("data.table")

#### DOWNLOAD CSV ####
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
dateDownload <- format(Sys.time(), "%Y-%m-%d")
download.file(fileUrl, destfile = paste0("./", dateDownload,"_week1_quiz.csv"), method = "curl")

data <- read.csv("./2021-02-10_week1_quiz.csv", sep=",", header = T)
tail(data)
data$FES
# How many properties are worth $1,000,000 or more?
# column "VAL" is splited from c(NA,1:24) being 24, 1000000+ income

sum(with(data, data$VAL=="24"))

#installed plyr to easy use of tables...
count(data$VAL == "24")

#### DOWNLOAD EXCEL ####

#Natural Gas Aquisition Program excel download
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
dateDownload <- format(Sys.time(), "%Y-%m-%d")
download.file(fileUrl, destfile = paste0("./", dateDownload,"_week1_quiz.xlsx"), method = "curl")

rowIndex <- 18:23 
colIndex <- 7:15

dat <- read.xlsx("./2021-02-10_week1_quiz.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

#### XML READ ####
# Read the XML data on Baltimore restaurants from here:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
# How many restaurants have zipcode 21231? 
####ATTENTION xmlTreeParse no le gusta HTTPS, canviar a HTTP

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternalNodes = T)

rootNode <- xmlRoot(doc)


zipcodes <- xpathSApply(rootNode, "///zipcode", xmlValue)
sum(zipcodes=="21231")


#### FRED() ####

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
dateDownload <- format(Sys.time(), "%Y-%m-%d")
download.file(fileUrl, destfile = paste0("./", dateDownload,"_week1_quiz3.csv"), method = "curl")

DT <- fread("./2021-02-10_week1_quiz3.csv")
head(DT)

mean(DT$pwgtp15,by=DT$SEX)
tapply(DT$pwgtp15,DT$SEX,mean)


a <-system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
b <- system.time(DT[,mean(pwgtp15),by=SEX])
c <- system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
times <- data.frame(sapply = a[1], DTmean = b[1], meanDT = c[1] )
times <- t(times)
a[1] < c[1]
