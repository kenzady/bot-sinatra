require 'facebook/messenger'
#require 'dotenv/load'
require_relative 'persistent_menu'
require_relative 'greetings'
require_relative 'text'
include Facebook::Messenger
#Facebook::Messenger::Bot
# NOTE: ENV variables should be set directly in terminal for testing on localhost


# IMPORTANT! Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
#Greetings.enable
#PersistentMenu.enable


# #Logic for postbacks
# def get_started
#   Bot.on :postback do |postback|
#     sender_id = postback.sender['id']
#     case postback.payload
#     when 'START' then show_humour_replies(postback.sender['id'], HUMOUR)
#     end
#   end
# end

# helper function to send messages declaratively and directly
def say(recipient_id, text, quick_replies = nil)
  message_options = {
  recipient: { id: recipient_id },
  message: { text: text }
  }
  if quick_replies
    message_options[:message][:quick_replies] = quick_replies
  end
  Bot.deliver(message_options, access_token: ENV['ACCESS_TOKEN'])
end

#ne pas oublier d'insérer la méthode is text message
def humour_analysis
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only
    sender_id = message.sender['id']
    answer = message.text
    if answer.include?("sévèrement") || answer.include?("moyennement")
      say(sender_id, ANS_HUMOUR[:bad], CAUSE_STRESS) #ask for the causes of the stress
    elsif answer.include?("pas")
      say(sender_id, ANS_HUMOUR[:good], AHEAD) #ask to continue though
    else
      say(sender_id, ANS_HUMOUR[:unknown_command], HUMOUR)
      humour_analysis
    end
    # case message.text
    # when /sévèrement/i, /moyennement/i, /mal/i, /triste/i, /malheureux/i #the user is stressed
    #   say(sender_id, ANS_HUMOUR[:bad], CAUSE_STRESS) #ask for the causes of the stress
    # when /pas/i, /heureux/i, /bien/i, /content/i # the user is not stressed
    #   say(sender_id, ANS_HUMOUR[:good], AHEAD) #ask to continue though
    # else #instead of clicking on a button, the user gave an input not understandable for Delphos
    #   message.reply(text: ANS_HUMOUR[:unknown_command]) #bot ask for new answer
    #   show_humour_replies(sender_id, HUMOUR) #re-show the menu with humour buttons
    # end
  end
end

# Display a set of quick replies that serves as a starter
def show_humour_replies(id, quick_replies)
  say(id, IDIOMS[:greetings], quick_replies)
  humour_analysis
end

# Start conversation loop (to remove after uncommenting the postback method which does not work yet)
def wait_for_any_input
  Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}"
  show_humour_replies(message.sender['id'], HUMOUR)
  end
end

# Check if the message input is in a text format
def is_text_message?(message)
  !message.text.nil?
end

wait_for_any_input
#get_started
