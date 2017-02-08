require 'oauth2'
require 'pry'
require './helpers'

callback_url = ENV['OAUTH_CALLBACK_URL'] || get_callback_url
client_id =  ENV['OAUTH_CLIENT_ID'] || get_client_id
client_secret = ENV['OAUTH_CLIENT_SECRET'] || get_client_secret
site = ENV['OAUTH_PROVIDER_URL']

client = OAuth2::Client.new(client_id, client_secret, :site => get_provider_url)
auth_url = client.auth_code.authorize_url(:redirect_uri => callback_url)
puts "Make sure WeCounsel server is running at #{get_provider_url}, visit the following URL and copy the 'code' query param in the redirected address line (ignore the page error):"
puts "#{auth_url}"
puts "Enter the code param here: "
code = gets.chomp
access = client.auth_code.get_token(code, :redirect_uri => callback_url)
token = access.token
puts
puts "Hooray! Here's your oAuth token: #{token}"
puts "Now you can for example open this link: "
puts "#{get_example_api_url(token)} (substitute 225 for existing Wecounsel user_id)"