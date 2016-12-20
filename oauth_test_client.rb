require 'oauth2'
require 'pry'

callback_url = ENV['OAUTH_CALLBACK_URL'] || 'http://localhost:3001/auth/wecounsel/callback'
client_id =  ENV['OAUTH_CLIENT_ID'] || '48375dcb5784d19b19623cbe70af64ef11b63227f6fae90cb9db44e5ae59a1a1'
client_secret = ENV['OAUTH_CLIENT_SECRET'] || '8b6fbde3b246d9da40bdc408466c406ce16501e891b87f40a2770e05fed7888a'

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