class SlackApiController < ApplicationController

    def send_message
        view_context.slack_send_messege_email("sample@example.org","hogeeegege")
    end

end
