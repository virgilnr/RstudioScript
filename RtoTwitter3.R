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

#covid
cvid = search_tweets(
  '#covid', n=1000, type = 'mixed', include_rts = F)

head(cvid$screen_name)
unique(cvid$screen_name)
print(cvid$text)
