class TwilioController < ApplicationController

  def new
  end

  def create
    seal_lyrics = [
      "There used to be a graying tower alone on the sea",
      "You became the light on the dark side of me",
      "Love remained a drug that's the high and not the pill",
      "But did you know that when it snows",
      "My eyes become large and the light that you shine can be seen.",
      "BAY-BEHHH",
      "I compare you to a kiss from a rose on the gray.",
      "Ooh",
      "The more I get of you the stranger it feels, yeahhh",
      "And now that your rose is in bloom, a light hits the gloom on the gray",
      "There is so much a man can tell you, so much he can say",
      "You remain my power, my pleasure, my pain",
      "To me you're like a growing addiction that I can't deny",
      "Won't you tell me is that healthy, baby?",
      "I've been kissed by a rose on the gray",
      "I've been kissed by a rose",
      "...And if I should fall along the way",
      "...been kissed by a rose on the gray.",
      "Yes I compare you to a kiss from a rose on the gray"
    ]

    seal_facts = [
      "'Kiss from a Rose' is a song from Seal's second eponymous album.",
      "Seal's 'Kiss from a Rose' was first released as a single in July 1994.",
      """Re-released in 1995, Seal's 'Kiss from a Rose' was included on the Batman 
      Forever film soundtrack, helping it top the charts in the U.S. and Australia.""",
      """At the 1996 Grammy Awards, Seal's 'Kiss from a Rose' won awards for 
      Record of the Year, Song of the Year, and Best Male Pop Vocal Performance.""",
      """Seal's 'Kiss from a Rose' topped the U.S. Billboard Hot 100 for one week 
      in August 1995. It also went to number four on the UK Singles Chart.""",
      """Seal's 'Kiss from a Rose' won the MTV Movie Award for Best Song from a 
      Movie in the 1996 edition.""",
      """Joel Schumacher called Seal to request use of the song 'Kiss From 
      A Rose' to play over a love scene between the characters played by 
      Nicole Kidman and Val Kilmer in Batman Forever. Although the song was 
      eventually not incorporated into this scene, it was instead used to play 
      over the end credits.""",
      """The original video for 'Kiss From A Rose' was set in a photographic 
      studio and was co-directed by Matthew Rolston and William Levin. 
      The 1966 film Blowup was heavily referenced in the video.""",
      """The second version of the video for 'Kiss From A Rose' was directed 
      by Joel Schumacher and has Seal performing the song beside the Bat-Signal, 
      interspersed with clips from the film Batman Forever.""",
      """In season 2, episode 7 ('A Bottle of Jean Nate') of Shameless, 
      'Kiss from a Rose' is revealed as Jody's go-to love-making song; he's 
      first seen having sex with Karen while listening to the song, and later 
      to Sheila, Karen's mother.""",
      """In season 5, episode 7 ('The Gang Wrestles for the Troops') of It's 
      Always Sunny in Philadelphia, Dee plans to greet a returning U.S. 
      soldier she's been chatting with online with her alias 'Desert Rose' 
      by bringing roses, dressing up in a red dress with green stockings, 
      and playing Seal's 'Kiss from a Rose'.""",
      """In season 3, episode 7 of Community, Jeff Winger (Joel McHale) and 
      dean Craig Pelton (Jim Rash) are seen singing 'Kiss from a Rose'. Later 
      in the episode the rest of the characters make fun of Jeff since the 
      dean has tweeted their duet.""",
      """In season 5, episode 17 ('The Death Of The Queen Bee') of Bones, 
      the song 'Kiss From A Rose' is featured in Temperance's reunion where 
      she and Booth do a slow dance to the song."""
    ]

    account_sid = ENV["account_sid"]'AC47a172ee7e3248ed5579fce1899c9849' 
    auth_token = ENV["auth_token"]'728da0623dbb4a56198a05df9cce3602' 
 
    @client = Twilio::REST::Client.new account_sid, auth_token 

    phone_num = params[:phone_number]
    message = params[:content] == 'lyric' ? seal_lyrics.sample : seal_facts.sample
 
    @client.account.messages.create({
      from: '+19292544762', 
      to: phone_num,
      body: message,   
    })

    redirect to root_path

  end

end
