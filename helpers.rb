# this is just for printing example of protected url that can be accessed with token
def get_example_api_url(token, id)
  host = case ENV['ENV']
    when 'staging'
      "https://staging.wecounsel.com"
    when 'edge'
      "https://test-pp.wecounsel.com"
    when 'production'
     "https://api.wecounsel.com"
    else
      "http://localhost:3000"
  end
  "#{host}/v1/users/#{id}?access_token=#{token}"
end