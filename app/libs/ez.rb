# Setup the connection for making requests.
Eztexting.connect!('UN','PW')
# => "credentials cached"

# Make a hash with the required keys of subject, message and phonenumber
# and then send out the SMS. It's that simple. 3 lines, 2 if you condense the creation of the Hash into the Method call.
# The response will be an array: the first element will be the response mapped from the code to the literal that the Ez Texting
# documentation lists; rhe second element will be the raw value. In some cases this bit is important - in the credit balance
# check this would be the number of credits.
options = {:subject => "testing out how awesome eztexting is", :phonenumber => "5555555555", :message => "Wow this is so simple and easy to use"}
Eztexting::Sms.single(options)
# => ["Message Sent",1]

# Check Your Credit Count
Eztexting::Credits.balance
# => ["The amount of plan and additional credits available", 54353]

# Check If A Keyword Is Available
Eztexting::Availablity.check("my_keyowrd_to_check")
# => ["The Keyword Is Available", 1]

# Make Voice Broadcast
options = {:phonenumbers => 5555555555, :soundsource => "http://mywebsite.com/dunder_mifflin_is_a_part_of_sabre.wav", :callerid => 5555555555}
Eztexting::Voice.broadcast(options)
# => ["Campaign Sent",1]
