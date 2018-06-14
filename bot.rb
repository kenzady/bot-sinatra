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


IDIOMS = {
  greetings: "Bonjour je m’appelle Delphos. Je suis ici pour t'aider à vivre mieux et pour vivre sans stress. Comment te sens-tu aujourd’hui ?",
  unknown_command: "Désolé, je n'ai pas compris ta réponse, peux-tu m'éclairer ?"
}

HUMOR = [
  {
    content_type: 'text',
    title: 'Sévèrement stréssé',
    payload: 'HIGLY_STRESSED'
  },
  {
    content_type: 'text',
    title: 'Peu stressé',
    payload: 'SOMEWHAT_STRESSED'
  },
  {
    content_type: 'text',
    title: 'Pas du tout stressé',
    payload: 'NOT_STRESSED'
  }
]

ANS_HUMOUR = {
    bad: "Ça tombe bien, je suis là pour t'aider ! Qu'est ce qui cause ton stress en ce moment ?",
    good: "Je suis ravi de l'apprendre ! Serais-tu quand-même intéressé(e) par le fait de mieux comprendre, puis potentiellement tester ma méthode ? Cela pourrait toujours te servir !",
    unknown_command: "Désolé, je n'ai pas compris ta réponse, peux-tu répéter ton action stp ?"
  }

CAUSE_STRESS = [
  {
    content_type: 'text',
    title: 'Famille',
    payload: 'FAMILLE'
  },
  {
    content_type: 'text',
    title: 'Vie sentimentale',
    payload: 'LOVE'
  },
  {
    content_type: 'text',
    title: 'Vie professionnelle',
    payload: 'WORK'
  },
  {
    content_type: 'text',
    title: 'Sport',
    payload: 'SPORT'
  },
  {
    content_type: 'text',
    title: 'Santé',
    payload: 'SANTE'
  },
  {
    content_type: 'text',
    title: 'Ne sais pas',
    payload: 'DONT_KNOW'
  }
]

AHEAD = [
  {
    content_type: 'text',
    title: 'Allons-y!',
    payload: 'GO'
  },
  {
    content_type: 'text',
    title: 'Non, merci!',
    payload: 'NO_THANKS'
  }
]

# #Logic for postbacks
# Bot.on :postback do |postback|
#   sender_id = postback.sender['id']
#   case postback.payload
#   when 'START' then show_replies_menu(postback.sender['id'], HUMOR)
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


def humour_analysis
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only
    sender_id = message.sender['id']
    answer = message.text
    # a tester avec des ifs > if answer.include?("sévèrement")||answer.include?()
    case message.text
    when /sévèrement/i, /moyennement/i, /mal/i, /triste/i, /malheureux/i #the user is stressed
      say(message.sender['id'], ANS_HUMOUR[:bad], CAUSE_STRESS) #ask for the causes of the stress
    when /pas/i, /heureux/i, /bien/i, /content/i # the user is not stressed
      say(message.sender['id'], ANS_HUMOUR[:good], AHEAD) #ask to continue though
    else #instead of clicking on a button, the user gave an input not understandable for Delphos
      message.reply(text: ANS_HUMOUR[:unknown_command]) #bot ask for new answer
      show_humour_replies(sender_id, HUMOUR) #re-show the menu with humor buttons
    end
  end
end

# Display a set of quick replies that serves as a starter
def show_replies_menu(id, quick_replies)
  say(id, IDIOMS[:greetings], quick_replies)
  humour_analysis
end

# Start conversation loop
def wait_for_any_input
  Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}"
  show_humour_replies(message.sender['id'], HUMOUR)
  end
end

# def is_text_message?(message)
#   !message.text.nil?
# end

wait_for_any_input
