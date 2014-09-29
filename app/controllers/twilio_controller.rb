class TwilioController < ApplicationController

  def new
  end

  def create
    @seal_lyrics = TwilioInfo.seal_lyrics
    @seal_facts = TwilioInfo.seal_facts

    account_sid = 'AC47a172ee7e3248ed5579fce1899c9849'#ENV["account_sid"] 
    auth_token = '728da0623dbb4a56198a05df9cce3602'#ENV["auth_token"] 
 
    @client = Twilio::REST::Client.new account_sid, auth_token 

    phone_num = params[:phone_number]
    message = params[:content] == 'lyric' ? @seal_lyrics.sample : @seal_facts.sample
 
    easter_egg_array = ["6666666666","666-666-6666","1-666-666-6666",
                        "(666)666-6666","16666666666","16666666666","6666666",
                        "666-6666"]

    if easter_egg_array.include?(phone_num)
      redirect_to "https://www.youtube.com/watch?v=ateQQc-AgEM"
    elsif phone_num.upcase == "BATMANFOREVER"
      redirect_to "https://www.youtube.com/watch?v=1MiAszO_ni0"
    else
      @client.account.messages.create({
        from: '+19292544762', 
        to: phone_num,
        body: message,   
      })
      redirect_to root_path
    end
  end

end
