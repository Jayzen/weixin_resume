# required
#WxPay.appid = 'wx6d75c38ee4586bf2'
#WxPay.key = 'wx6d75c38ee4586bf2wx6d75c38ee458'
#WxPay.mch_id = '1536207291'
#WxPay.debug_mode = true # default is `true`
#WxPay.sandbox_mode = false # default is `false`

# cert, see https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=4_3
# using PCKS12
#WxPay.set_apiclient_by_pkcs12(File.read(File.dirname(__FILE__)+"/apiclient_cert.p12"), "1536207291")

# if you want to use `generate_authorize_req` and `authenticate`
#WxPay.appsecret = '11b46a0999952d5df6a480c6a6a1b678' 

# optional - configurations for RestClient timeout, etc.
#WxPay.extra_rest_client_options = {timeout: 2, open_timeout: 3}
