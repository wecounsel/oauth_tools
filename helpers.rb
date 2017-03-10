# *** If you are running this script against a local Wecounsel server, copy the values of Application(Client) ID, Secret
# and Callback URL from http://localhost:300/oauth/applications and paste them in the appropriate methods bellow  ****

def get_client_id
  ENV['ENV'] == 'staging' ? '0888eac35508681fd4f4d9e682986f5565e35101d2d456054125cb7326b3ad20' : '48375dcb5784d19b19623cbe70af64ef11b63227f6fae90cb9db44e5ae59a1a1'
end

def get_client_secret
  ENV['ENV'] == 'staging' ? 'd44bb1271bd2d8923ce2e3e121cc0ec085365e89671ca348e7bf62ab6686ff77' : '8b6fbde3b246d9da40bdc408466c406ce16501e891b87f40a2770e05fed7888a'
end

def get_callback_url
  ENV['ENV'] == 'staging' ? 'https://example.com/oauth/wecounsel/callback' : 'http://localhost:3001/auth/wecounsel/callback'
end

# ************************

def get_provider_url
  ENV['ENV'] == 'staging' ? 'https://staging.wecounsel.com' : 'http://localhost:3000'
end

# this is just for printing example of protected url that can be accessed with token
def get_example_api_url(token)
  ENV['ENV'] == 'staging' ? "https://staging.wecounsel.com/v1/users/225?access_token=#{token}" :
      "http://localhost:3000/v1/users/225?access_token=#{token}"
end