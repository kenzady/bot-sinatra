require 'facebook/messenger'
#require 'dotenv/load'
require_relative 'persistent_menu'
require_relative 'greetings'
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

ANS_HUMOR = {
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


OBJECTIF_PRIORITAIRE = 
[
  {
    content_type: 'text',
    title: 'Maîtriser mes peurs',
    payload: 'PEURS'
  },
  {
    content_type: 'text',
    title: 'Gagner de la confiance en moi',
    payload: 'CONFIANCE'
  },
  {
    content_type: 'text',
    title: 'Mieux gérer mon stress',
    payload: 'GERER_STRESS'
  },
  {
    content_type: 'text',
    title: 'Éviter le confllit',
    payload: 'CONFLIT'
  },
  {
    content_type: 'text',
    title: 'Vivre le moment présent',
    payload: 'VIVRE_PRESENT'
  },
  {
    content_type: 'text',
    title: 'Je ne sais pas trop',
    payload: 'NE_SAIT_PAS'
  }
]


RESOUDRE_CELA = [
  {
    content_type: 'text',
    title: 'Oui',
    payload: 'OUI_ESSAYE_RESOUDRE'
  },
  {
    content_type: 'text',
    title: 'Plus ou moins',
    payload: 'PLUS_OU_MOINS_RESOUDRE'
  },
  {
    content_type: 'text',
    title: 'Non',
    payload: 'NON_RESOUDRE'
  }
]

MARCHE = [
  {
    content_type: 'text',
    title: 'Oui',
    payload: 'OUI_MARCHE'
  },
  {
    content_type: 'text',
    title: 'Plus ou moins',
    payload: 'PLUS_OU_MOINS_MARCHE'
  },
  {
    content_type: 'text',
    title: 'Non',
    payload: 'NON_MARCHE'
  }
]

PLUS_AIDE = [
  {
    content_type: 'text',
    title: 'Aide exterieure',
    payload: 'AIDE_EXTERIEURE'
  },
  {
    content_type: 'text',
    title: 'Motivation personnelle',
    payload: 'MOTIVATION_PERSO'
  },
  {
    content_type: 'text',
    title: 'Les deux',
    payload: 'LES_DEUX'
  }
]


AIDE_EXTERIEURE = [
  {
    content_type: 'text',
    title: 'Aide professionelle',
    payload: 'AIDE_PRO'
  },
  {
    content_type: 'text',
    title: 'Aide de mon entourage',
    payload: 'AIDE_ENTOURAGE'
  },
  {
    content_type: 'text',
    title: 'Aide sur Internet',
    payload: 'AIDE_INTERNET'
  }
]

MOTIVE = [
  {
    content_type: 'text',
    title: 'Oui !',
    payload: 'OUI_MOTIVE'
  },
  {
    content_type: 'text',
    title: 'Non ...',
    payload: 'NON_MOTIVE'
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

def unknown_command
    message.reply(text: ANS_HUMOR[:unknown_command]) #bot ask for new answer
    show_replies_menu(sender_id, HUMOR) #re-show the menu with humor buttons
end

def wait_for_command
  Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}"
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only
    sender_id = message.sender['id']
    case message.text
    when /sévèrement/i, /moyennement/i, /mal/i, /triste/i, /malheureux/i #the user is stressed
      say(message.sender['id'], ANS_HUMOR[:bad], CAUSE_STRESS) #ask for the causes of the stress
    when /pas/i, /heureux/i, /bien/i, /content/i # the user is not stressed
      say(message.sender['id'], ANS_HUMOR[:good], AHEAD) #ask to continue though
    else #instead of clicking on a button, the user gave an input not understandable for Delphos
      unknown_command
    end
  end
end

# Display a set of quick replies that serves as a starter
def show_replies_menu(id, quick_replies)
  say(id, IDIOMS[:greetings], quick_replies)
  wait_for_command
end

# Start conversation loop
def wait_for_any_input
  Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}"
    puts "Received '#{message.inspect}' from #{message.sender}"
    show_replies_menu(message.sender['id'], HUMOR)
  end
end

# def is_text_message?(message)
#   !message.text.nil?
# end




# def greetings
#   Bot.on :message do |message|
#       puts "Received '#{message.inspect}' from #{message.sender}"
#     message.reply(text: IDIOMS[:greeting])
#   end
# end

wait_for_any_input
