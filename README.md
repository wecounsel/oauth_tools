# oauth_tools

A collection of tools and scripts related to oAuth.

##oauth_test_client
A client test script that requests and receives an oauth access token from the Wecounsel oAuth provider. [Read here](https://docs.google.com/document/d/14JDt2Vfmw4AfAjMOUukgj1YD01sBm0o5si4TXezggmU/edit?usp=sharing) more details on how to use it to test client applications that authorize with Wecounsel.  

For a quick start, do the following:
- Clone the project
- Make sure that the server you are testing has an oauth app defined or create a new one. For Wecounsel, that would be at `<wecounsel>/oauth/applications`. Write down the values for `client_id`, `client_secret` and `callback_url`
- Add `secrets.yml` file with appropriate section for each environment you want to test. Change the values according to previous paragraph:

        edge:
          provider_url: https://test-pp.wecounsel.com
          client_id: d2c4c07bf5f38e74e6cdc28f8dd5de2ede8c1a38351ebfe1f27bc59ae15be805
          client_secret: af6c7880563f473135acc2d50fde98da4909f0b13150a8b12fc4034b09ff5b34
          callback_url: https://example.com/oauth/wecounsel/callback
 
 - Run the script and follow instructions: `ENV=edge ruby oauth_test_client.rb`
