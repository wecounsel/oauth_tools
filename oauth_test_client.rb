require 'oauth2'
require 'pry'
require './hash'
require './helpers'
require './settings'

Settings.load!("secrets.yml", :env => ENV['ENV'] || 'development')

client = OAuth2::Client.new(Settings.client_id, Settings.client_secret, :site => Settings.provider_url)
auth_url = client.auth_code.authorize_url(:redirect_uri => Settings.callback_url)

if ['staging', 'edge', 'production'].include?(ENV['ENV'])
  puts "Visit the following URL, sign-in with your Wecounsel account, and copy the 'code' query param in the redirected address line (ignore the page error):"
else
  puts "1) Visit #{Settings.provider_url}/oauth/applications , add a new application, and copy the the values of Application ID, Secret and Callback URL to secrets.yml"
  puts "2) Make sure WeCounsel server is running at #{Settings.provider_url}, visit the following URL, sign-in with your Wecounsel account, and copy the 'code' query param in the redirected address line (ignore the page error):"
end

puts "#{auth_url}"
puts
puts "Enter the code param here: "
code = gets.chomp
token = client.auth_code.get_token(code, :redirect_uri => Settings.callback_url)
puts
puts "Hooray! Here's your oAuth access token: #{token.token}"
if token.refresh_token
  puts "And here's your refresh token: #{token.refresh_token} . You can use it to get a new access token, when the existing one expires. "
end
puts
puts "Now getting your user info..."
user_response = token.get('/v1/users/me')
user_info = JSON.parse(user_response.body)
puts "Your user info: #{user_info}"
puts "Now you can for example access this link: #{get_example_api_url(token.token, user_info["data"]["id"].to_i)}"
