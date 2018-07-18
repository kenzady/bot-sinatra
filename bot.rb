require 'facebook/messenger'
# require 'dotenv/load'
require_relative 'persistent_menu'
require_relative 'greetings'
require_relative 'text'
require_relative 'stress_management'
require_relative 'methode'
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
def humour_analysis(sender_id)
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only
    answer = message.text.downcase
    if answer.include?("sévèrement") || answer.include?("moyennement")
      say(sender_id, ANS_HUMOUR[:bad], CAUSE_STRESS) # Asks for the causes of the stress
      what_is_ur_objective(sender_id)
    elsif answer.include?("peu")
      say(sender_id, ANS_HUMOUR[:good], AHEAD) # Asks to continue though
      what_is_ur_objective(sender_id)
    elsif
      say(sender_id, ANS_HUMOUR[:unknown_command], HUMOUR)
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
    # gif_options = {
    #   recipient: { id: sender_id },
    #   attachment: {
    #     type: 'image',
    #     payload: {
    #       url: 'https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif'
    #     }
    #   }
    # }
    if message
      say(sender_id, "Okay, super ! Ne t'inquiète pas, nous allons travailler là-dessus. 😊")
      StressManagement.stress_mgmt_init(sender_id)
    end
  end
#  Bot.deliver(gif_options, access_token: ENV['ACCESS_TOKEN']) # cat working gif
end

# doublon auriane, je ne supprime pas pour l'instant au cas où j'ai fait une connerie
# def essaye_resoudre_cela(recipient_id)
#   Bot.on :message do |message|
#     answer = message.text.downcase
#     if answer.include?("oui")
#       say(message.sender['id'], ANS_RESOLUTION_STRESS[:oui], RAISONS_EFFICACITE)
#     elsif answer.include?("plus")
#       say(message.sender['id'], ANS_RESOLUTION_STRESS[:moins], RAISONS_EFFICACITE)
#     elsif answer.include?("pas")
#     say(message.sender['id'], ANS_RESOLUTION_STRESS[:non], PQ_INACTION)
#     pourquoi_inaction(message.sender['id'])
#     else
#       say(message.sender['id'], IDIOMS[:unknown_command])
#     end
#   end
# end


# def pourquoi_inaction(recipient_id)
#   Bot.on :message do |message|
#       answer = message.text.downcase
#       if answer.include?("n'osais")
#         say(message.sender['id'], "Ca arrive souvent en effet. Ne t'inquiète pas, ici tes données sont protégées et je ne divulguerai pas ce que tu me dis. Tu es libre de dire ce que tu veux ! Nous allons travailler ensemble pour que tu ailles mieux. Allons-y !")
#       elsif answer.include?("savais")
#         say(message.sender['id'], "C'est un problème assez commun. Malgré les nombreuses ressources à disposition, il est parfois difficile de trouver un outil qui nous convient. En tous cas, je suis la pour t'aider à aller mieux et nous allons parcourir ce chemin ensemble")
#       elsif answer.include?("moyens")
#       say(message.sender['id'], "Bonne nouvelle, je suis gratuit ET à ta disposition 24/24, n'est-ce pas génial ? Tu peux me contacter à tout moment et je serai la pour t'aider, deal ?")
#       elsif answer.include?("besoin")
#       say(message.sender['id'], "Alors je suis ravi que tu aies compris que tu avais besoin d'aide et que tu soies venu me voir. Je suis la pour t'aider et nous allons faire en sorte que tu ailles mieux, ensemble. Allons y !")
#       else
#         say(message.sender['id'], IDIOMS[:unknown_command])
#       end
#     end
# end


wait_for_any_input

# get_started
