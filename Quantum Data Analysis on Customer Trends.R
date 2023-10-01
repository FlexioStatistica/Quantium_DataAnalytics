library(dplyr)
library(ggplot2)
install.packages("readxl")
library(readxl)
library(rstatix)
library(scales)
#install.packages("reshape")
library(reshape)
#install.packages('rmarkdown', dep= TRUE)
library(rmarkdown)

#Pull both excel sheets and combine into one big one

unzip(zipfile = "C:\\Users\\FEF-W\\OneDrive\\Documents\\GitHub\\Quantium_DataAnalytics\\QVI_transaction_data.xlsx", files= "QVI_transaction_data.xlsx", exdir = "." )

data_purchase <-read_excel("C:\Users\FEF-W\OneDrive\Documents\GitHub\Quantium_DataAnalytics\QVI_purchase_behaviour.csv")
data_transaction <-read_excel("C:\\Users\\FEF-W\\OneDrive\\Documents\\GitHub\\Quantium_DataAnalytics\\QVI_transaction_data.xlsx")

product <-  data_transaction %>%
  mutate(Revenue = data_transaction$PROD_QTY * data_transaction$TOT_SALES)
  group_by(data_transaction$PROD_NB)
  #Density plot to show shape of these distributions
  ggplot(aes(x = data_transaction$TOT_SALES, fill = data_transaction$PROD_NAME)) + geom_density(alpha = 0.3)
  #Boxplot to see the cluster of values and outliers
  ggplot(aes(x = data_transaction$TOT_SALES, fill = data_transaction$PROD_NAME)) + geom_boxplot()
  