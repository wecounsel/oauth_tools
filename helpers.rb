# this is just for printing example of protected url that can be accessed with token
def get_example_api_url(token)
  case ENV['ENV']
    when 'staging'
      "https://staging.wecounsel.com/v1/users/225?access_token=#{token}"
    when 'edge'
      "https://test-pp.wecounsel.com/v1/users/225?access_token=#{token}"
    else
      "http://localhost:3000/v1/users/225?access_token=#{token}"
  end
end