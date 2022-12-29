module SlackApiHelper

    def slack_send_messege_email(email,text)

        token = ENV['SLACK_API_TOKEN']

        #SlackのユーザーIDを取得
        
        request_path = "https://slack.com/api/users.lookupByEmail?email=#{email}"
        
        uri = URI.parse(request_path)
        http = Net::HTTP.new(uri.host, uri.port)
        
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        req = Net::HTTP::Get.new(uri.request_uri)
        req["Authorization"] = "Bearer #{token}"

        res = http.request(req)

        api_response = JSON.parse(res.body)
        slack_user_id = api_response['user']['id']
        slack_user_name = api_response['user']['name']

        #SlackのユーザーIDからメッセージを送信

        request_path = 'https://slack.com/api/chat.postMessage'
        
        uri = URI.parse(request_path)
        http = Net::HTTP.new(uri.host, uri.port)
        
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        req = Net::HTTP::Post.new(uri.request_uri)
        req["Content-Type"] = "application/json"
        req["Authorization"] = "Bearer #{token}"
        
        body = {
            "channel" => "#{slack_user_id}",
            "text" => "#{text}",
        }.to_json
        
        req.body = body
        res = http.request(req)

        res.msg

    end

end
