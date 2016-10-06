require 'oauth2'
require 'pry'

callback_url = 'http://localhost:3000/oauth/test_client/callback'
client_id = '59c5bb1b338be44b459e003bb9191b3198c00bb8bf9fb8720e0fd85b94a3489d'
client_secret = '7993a3f010ba268a52fb850c263f2eb5ee0affbedfaf184432eb4d786152a47b'

client = OAuth2::Client.new(client_id, client_secret, :site => 'http://localhost:3000')
auth_url = client.auth_code.authorize_url(:redirect_uri => callback_url)
puts "Visit the following URL and copy the 'code' query param in the redirected URL: #{auth_url}"
puts "Enter the code param here: "
code = gets.chomp
access = client.auth_code.get_token(code, :redirect_uri => callback_url)
token = access.token
puts "Hooray! Here's your oAuth token: #{token}"