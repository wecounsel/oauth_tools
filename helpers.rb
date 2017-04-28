# this is just for printing example of protected url that can be accessed with token
def get_example_api_url(token)
  ENV['ENV'] == 'staging' ? "https://staging.wecounsel.com/v1/users/225?access_token=#{token}" :
      "http://localhost:3000/v1/users/225?access_token=#{token}"
end