require 'dotenv'
require 'fileutils'
require 'securerandom'
require 'tumblr_client'

Dotenv.load

# Authenticate via OAuth
client = Tumblr::Client.new({
  :consumer_key => ENV['CONSUMER_KEY'],
  :consumer_secret => ENV['CONSUMER_SECRET'],
  :oauth_token => ENV['OAUTH_TOKEN'],
  :oauth_token_secret => ENV['OAUTH_TOKEN_SECRET']
})

client.photo('dadaphotobooth.tumblr.com', {data: 'glitch.gif'})

clean_up

def clean_up
  uuid = SecureRandom.uuid
  new_filename = "glitch-#{uuid}.gif"
  File.rename('glitch.gif', new_filename)
  FileUtils.mv(new_filename, "/artifacts/#{new_filename}")
end

