class TwilioController < ActionController::Base
  
  def index
    message_body = params["Body"]
    from_number = params["From"].gsub("+","")[1..-1]
    user = User.find_by(phone: from_number)
    
    twilio = ::TwilioCommands.new({body: message_body, sender: user})
    twilio.parse_body
    render nothing: true
  end
end
