appname <- ''
key <- ''
secret <- ''
access_token <- ''
access_secret <- ''

twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret,
  access_token = access_token,
  access_secret = access_secret)

post_tweet(status = "We'll fly.")

#BTS
BTS = search_tweets(
  '#BTS', n=100, type = 'mixed', include_rts = F)

#HakAsasiManusia
HAM = search_tweets(q = '#HakAsasiManusia',
                    n = 150)

#KontraS
KS = search_tweets(q='#KontraS',
                   n= 150,
                   include_rts = F)

head(KS)
head(HAM, n=6)
head(BTS$screen_name)

unique(BTS$screen_name)
attach(HAM)
head(screen_name, n=6)
unique(KS$screen_name)

#menggunakan fungsi search_users
#fungsi search_users memungkinkan kita untuk melihat pengguna twitter 
##yang menulis tentang suatu hal pada akunnya.
#fungsi ini hanya akan menampilkan nama pengguna dan infromasi pengguna
usrinfo <- search_users(q='#Feminism',
                        n=1000)
attach(usrinfo)
head(usrinfo$user_id)
unique(usrinfo$screen_name)
length(usrinfo$location)

#GRAFIK DENGAN GGPLOT

usrinfo%>%
  ggplot(aes(location))+
  geom_bar() + coord_flip() + 
  labs(x = 'Location', 
       y= 'Count',
       title = 'Feminism-Unique Location')

#Sort top 20
#menggunakan fungsi top_n()
#Mengukur setidaknya 15 users dengan top_n()
# %>% is called multiple times to "chain" functions together, 
#which accomplishes the same result as nesting.
usrinfo%>%
  count(location, sort = T)%>%
  mutate(reorder(location, n))%>%
  top_n(20)%>%
  ggplot(aes(x=location, y=n))+
  geom_col()+coord_flip()+
  labs(x= 'Location',
       y= 'Count',
       title = 'Feminism-Unique Location')

usrinfo%>%
  count(location, sort = T)%>%
  mutate(location = reorder(location, n))%>%
  na.omit(location)%>%
  top_n(20)%>%
  ggplot(aes(x=location, y=n))+
  geom_col()+coord_flip()+
  labs(x= 'Location',
       y= 'Count',
       title = 'Feminism-Unique Location')


usrinfo%>%
  count(lang, sort=T)%>%
  mutate(lang = reorder(lang, n))%>%
  na.omit(lang)%>%
  top_n(5)%>%
  ggplot(aes(x=lang, y=n))+
  geom_col()+coord_flip()+
  labs(x= 'Language',
       y= 'Count',
       title = 'Feminism-Unique Language')