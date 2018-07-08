require 'facebook/messenger'
# require 'dotenv/load'
require_relative 'persistent_menu'
require_relative 'greetings'
require_relative 'text'
require_relative 'stress_management'
include Facebook::Messenger
# Facebook::Messenger::Bot
# NOTE: ENV variables should be set directly in terminal for testing on localhost


# IMPORTANT! Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
# Greetings.enable
# PersistentMenu.enable


# # Logic for postbacks
# def get_started
#   Bot.on :postback do |postback|
#     sender_id = postback.sender['id']
#     case postback.payload
#     when 'START' then show_humour_replies(postback.sender['id'], HUMOUR)
#     end
#   end
# end

# Helper function to send messages declaratively and directly
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

# Ne pas oublier d'insérer la méthode is_text_message?(message)
def humour_analysis
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only
    sender_id = message.sender['id']
    answer = message.text.downcase
    if answer.include?("sévèrement") || answer.include?("moyennement")
      say(sender_id, ANS_HUMOUR[:bad], CAUSE_STRESS) # Asks for the causes of the stress
      what_is_ur_objective
    elsif answer.include?("peu")
      say(sender_id, ANS_HUMOUR[:good], AHEAD) # Asks to continue though
      what_is_ur_objective
    else
      say(sender_id, ANS_HUMOUR[:unknown_command], HUMOUR)
      humour_analysis
    end
  end
end

# Displays a set of quick replies that serves as a starter
def show_humour_replies(id, quick_replies)
  say(id, IDIOMS[:greetings], quick_replies)
  humour_analysis
end

# Starts conversation loop (to remove after uncommenting the postback method which does not work yet)
def wait_for_any_input
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}"
    show_humour_replies(message.sender['id'], HUMOUR)
  end
end

# Checking if the message input is in a text format
def is_text_message?(message)
  !message.text.nil?
end

# Checking on what the user wants to work on
def what_is_ur_objective
  Bot.on :message do |message|
    say(message.sender['id'], IDIOMS[:objectives], OBJECTIVES)
    handle_objective(message.sender['id'])
  end
end

def handle_objective(recipient_id)
  Bot.on :message do |message|
    # gif_options = {
    #   recipient: { id: recipient_id },
    #   attachment: {
    #     type: 'image',
    #     payload: {
    #       url: 'https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif'
    #     }
    #   }
    # }
    say(message.sender['id'], "Okay, super ! Ne t'inquiète pas, nous allons travailler là-dessus. 😊")
    say(message.sender['id'], IDIOMS[:gestion_stress], GESTION_STRESS)

    #StressManagmenent.stress_mgmt_init(recipient_id)
  end
#  Bot.deliver(gif_options, access_token: ENV['ACCESS_TOKEN']) # cat working gif
end



wait_for_any_input

# get_started
