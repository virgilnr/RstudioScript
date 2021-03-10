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
