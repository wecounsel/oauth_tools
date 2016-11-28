require 'oauth2'
require 'pry'

callback_url = 'http://localhost:3001/auth/wecounsel/callback'
client_id = '24f58e3b8a0bca3c8f650572bfb0726b6f09c819cc73c1533c935c6b2e213529'
client_secret = '8c4c50624297675cac4fdd10b0fa4b277c6ae8e30d675853eab06c1a9cc12775'

client = OAuth2::Client.new(client_id, client_secret, :site => 'http://localhost:3000')
auth_url = client.auth_code.authorize_url(:redirect_uri => callback_url)
puts "Make sure WeCounsel server is running at http://localhost:3000, visit the following URL and copy the 'code' query param in the redirected address line (ignore the load error):"
puts "#{auth_url}"
puts "Enter the code param here: "
code = gets.chomp
access = client.auth_code.get_token(code, :redirect_uri => callback_url)
token = access.token
puts
puts "Hooray! Here's your oAuth token: #{token}"
puts "Now you can for example open this link: "
puts "http://api.lvh.me:3000/v1/users/225?access_token=#{token} (substitute 225 for existing user_id)"