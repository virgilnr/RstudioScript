#Install package rtweet
install.packages('rtweet')
#Load package rtweet
library(rtweet)

#Membuat variable untuk menyimpan elemen app twitter
appname <- ''
key <- ''
secret <- ''
token <- ''
secret_token <- ''

#Membuat token untuk akses Twitter
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret,
  access_token = token,
  access_secret = secret_token)

#Melakukan posting Tweet
post_tweet(status = "Hello everyone!, here from RStudio")

#Mendownload tweet berdasarkan hashtag
cvid = search_tweets(
  '#covid', n=1000, type = 'mixed', include_rts = F)

#Memanggil/melakukan print data twitter yang sudah didapat ke console
View(cvid) #Melihat hasil download tweet dalam bentuk dataframe
print(cvid$text) #Melakukan print pada kolom text di data frame hasil download tweet (print tweet)
head(cvid$screen_name) #Melihat nama-nama pengguna dengan melakukan print screen_name dari data frame ke console (hanya 6 nama teratas)
unique(cvid$screen_name) #Melihat nama-nama pengguna dengan melakukan print screen_name dari data frame ke console (menampilkan semua nama)

