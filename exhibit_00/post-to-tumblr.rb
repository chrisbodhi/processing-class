require 'dotenv'
require 'tumblr_client'

Dotenv.load

# Authenticate via OAuth
client = Tumblr::Client.new({
  :consumer_key => ENV['CONSUMER_KEY'],
  :consumer_secret => ENV['CONSUMER_SECRET'],
  :oauth_token => ENV['OAUTH_TOKEN'],
  :oauth_token_secret => ENV['OAUTH_TOKEN_SECRET']
})

image = File.open('cropped.jpg', 'rb').read

client.photo('dadaphotobooth.tumblr.com', {data: 'cropped.jpg'})

