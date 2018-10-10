# this is just for printing example of protected url that can be accessed with token
def get_example_api_url(token, id)
  "#{Settings.provider_url}/v1/users/#{id}?access_token=#{token}"
end