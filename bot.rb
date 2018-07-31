require 'facebook/messenger'
# require 'dotenv/load'
require_relative 'persistent_menu'
require_relative 'greetings'
require_relative 'text'
require_relative 'stress_management'
require_relative 'methode'
require_relative 'exercices/introduction_hexaflex'
require_relative 'exercices/textes_introduction_hexaflex'
include Facebook::Messenger
# Facebook::Messenger::Bot
# NOTE: ENV variables should be set directly in terminal for testing on localhost


# IMPORTANT! Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
Greetings.enable
PersistentMenu.enable


# Logic for postbacks
def get_started
  Bot.on :postback do |postback|
    puts "Received '#{postback.inspect}' from #{postback.sender}"
    sender_id = postback.sender['id']
    case postback.payload
    when 'GET_STARTED_PAYLOAD' then show_humour_replies(sender_id, HUMOUR)
    when 'EXERCICES_MENU'
      say(sender_id, PRESENTATION_HEXAFLEX[:question_choix_dimension], LISTE_DIMENSIONS)
      IntroductionHexaflex.analyse_choix_dimension(sender_id)
    end
  end
end

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
def humour_analysis(sender_id)
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only
    message.mark_seen
    answer = message.text.downcase
    if answer.include?("sévèrement") || answer.include?("moyennement")
      message.typing_on
      say(sender_id, ANS_HUMOUR[:bad], CAUSE_STRESS) # Asks for the causes of the stress
      what_is_ur_objective(sender_id)
    elsif answer.include?("peu") || answer.include?("pas")
      say(sender_id, ANS_HUMOUR[:good], AHEAD) # Asks to continue though
      Methode.methode_init(sender_id) #goes straight to the method
    elsif
      say(sender_id, IDIOMS[:unknown_command], HUMOUR)
      humour_analysis(sender_id)
    end
  end
end


# Displays a set of quick replies that serves as a starter
# Displays a set of quick replies that serves as a starter
def show_humour_replies(sender_id, quick_replies)
  say(sender_id, IDIOMS[:greetings], quick_replies)
  humour_analysis(sender_id)
end

# Starts conversation loop (to remove after uncommenting the postback method which does not work yet)
def wait_for_any_input
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}"
    sender_id = message.sender['id']
    show_humour_replies(sender_id, HUMOUR)
  end
end

# Checking if the message input is in a text format
def is_text_message?(message)
  !message.text.nil?
end

# Checking on what the user wants to work on
def what_is_ur_objective(sender_id)
  Bot.on :message do |message|
    answer = message.text.downcase
    if answer.include?("non")
      say(sender_id, "Okay ! N'hésite pas à revenir si tu as besoin d'aide !")
    else
      say(sender_id, IDIOMS[:objectives], OBJECTIVES)
      handle_objective(sender_id)
    end
  end
end

def handle_objective(sender_id)
  Bot.on :message do |message|
    if message
      say(sender_id, "Okay, super ! Ne t'inquiète pas, nous allons travailler là-dessus. 😊")
      message.reply(
      attachment: {
        type: 'image',
        payload: {
          url: 'https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif'
        }
      }
      )
      StressManagement.stress_mgmt_init(sender_id)
    end
  end
end

#wait_for_any_input

get_started
