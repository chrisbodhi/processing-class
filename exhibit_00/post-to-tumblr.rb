require 'dotenv'
require 'fileutils'
require 'securerandom'
require 'tumblr_client'

Dotenv.load

def clean_up
  uuid = SecureRandom.uuid
  new_filename = "glitch-#{uuid}.gif"

  FileUtils.remove(Dir.glob('artifacts/f*.gif'))
  File.rename('glitch.gif', new_filename)
  FileUtils.mv(new_filename, "artifacts/#{new_filename}")
end

# Authenticate via OAuth
client = Tumblr::Client.new({
  :consumer_key => ENV['CONSUMER_KEY'],
  :consumer_secret => ENV['CONSUMER_SECRET'],
  :oauth_token => ENV['OAUTH_TOKEN'],
  :oauth_token_secret => ENV['OAUTH_TOKEN_SECRET']
})

begin
  client.photo('dadaphotobooth.tumblr.com', {data: 'glitch.gif'})
  puts "Done posting glitch.gif to Tumblr.\n"
rescue
  puts "Error saving to Tumblr.\n"
end

clean_up

