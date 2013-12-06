class TwilioCommands
  include ActiveModel::Model
  
  attr_accessor :body, :sender


  def parse_body
    puts @body
    split_message = @body.split(' ', 2)
    method = split_message[0].downcase
    if split_message.length > 1
      tasks = split_message[1].split(', ')
      arguments = tasks.uniq
      send(method, *arguments)
    else
      send(method)
    end
  end


  def method_missing(arg, *args, &block)
    message = "Sorry, Howard does not recognize your command"
    send_response(message)
  end

  def add(*task_content)
  	task_content.each do |task_body|
  	  @sender.tasks.create({content: task_body, done: false})
  	end
    $redis.publish("howard", @sender.to_json)
  end


  def hello(*args)
    message = "hello #{@sender.name}! What do you have to do today?"
    send_response(message)
  end

  alias :hi :hello
  alias :hey :hello


  def help
    message  = ""
  end


  def get_twilio_client
    twilio_sid = "AC8db1f551f828af01e00edef4919de64f"
    twilio_token = "5ced72aba0247a47da769d339d272411"
    Twilio::REST::Client.new twilio_sid, twilio_token
  end

  def send_response(message)
    client = get_twilio_client
    
    client.account.sms.messages.create(
      :from => "+19782963056",
      :to => @sender.phone,
      :body => message
    )

  end

end