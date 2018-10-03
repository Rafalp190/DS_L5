# install.packages(c("quanteda", "tm", "dplyr", "RCurl","wordcloud", "quantmod"))
# Cargar paquetes

library(dplyr)
library(RCurl)
library(tm)
library(wordcloud)
library(quanteda)

# Cargar el dataset

reviews <- read.csv("data/GrammarandProductReviews.csv", encoding = "UTF-8")

txt = iconv(reviews$reviews.text, to="ASCII//TRANSLIT")

#------------------------------------------------------------------------------------------------------------------------------
# Preprocessing
#------------------------------------------------------------------------------------------------------------------------------

corpus <- Corpus(VectorSource(txt))

reviews_cl <- corpus %>% 
  tm_map(tolower) %>% 
  tm_map(stripWhitespace) %>% 
  tm_map(removePunctuation) %>% 
  tm_map(removeWords, stopwords("english")) %>% 
  tm_map(removeNumbers) %>% 
  tm_map(stemDocument) %>% 
  tm_map(stripWhitespace)


  