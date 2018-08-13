require_relative 'textes_acceptation'
require_relative '../structure unique/gestion_generale_exos'
require_relative '../structure unique/textes_gestion_gen_exos'
require_relative '../textes_introduction_hexaflex'
require_relative '../../text'

class Acceptation
  # def self.exo_random(sender_id)
  #   exos_acceptation = ["exo_allumette", "exo_embrasser_le_mauvais"]
  #   exercice = exos_acceptation.sample

  #   if exercice == "exo_allumette"
  #     exos_acceptation[1] = "exo_embrasser_le_mauvais"
  #     Acceptation.exo_allumette(sender_id, exos_acceptation)
  #   elsif exercice == "exo_embrasser_le_mauvais"
  #     exos_acceptation[1] = "exo_allumette"
  #     Acceptation.exo_embrasser_le_mauvais(sender_id, exos_acceptation)
  #   end
  #end

  def self.exo_allumette(sender_id, exos_acceptation)
    say(sender_id, ALLUMETTE[:intro_nom], START_EXERCISE) #nom de l'exercice #demande s'il veut faire l'exercice ou changer d'exercice ou de dimension

    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, commence l'intro de l'exo
        say(sender_id, ALLUMETTE[:intro_exercice]) #commence l'intro de l'exercice
        message.reply( #gif allumette
          attachment: {
            type: 'image',
            payload: {
              url: 'https://media.giphy.com/media/l46C7JaUA0ZGW7aec/giphy.gif'
            }
          }
        )
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          say(sender_id, ALLUMETTE[:souffle]) #on dit qu'on souffle dessus. On demande ce qui se passe si c'est un building en feu
          say(sender_id, ALLUMETTE[:gros_feu])
          message.reply( #gif bob l'éponge
            attachment: {
              type: 'image',
              payload: {
                url: 'https://media.giphy.com/media/nrXif9YExO9EI/giphy.gif'
              }
            }
          )
          say(sender_id, ALLUMETTE[:explication_metaphore]) #on explique la métaphore
          say(sender_id, ALLUMETTE[:explication_part_2]) #on explique la métaphore partie 2 pour pas que ce soit trop long
          say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
          GeneraleExos.analyse_feedback(sender_id, Acceptation, exos_acceptation, "exo_allumette") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, exos_acceptation, Acceptation, "exo_allumette") #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) # Redirige vers l'explication brève des dimensions
      else
        say(sender_id, ALLUMETTE[:intro_nom], START_EXERCISE) #pas compris, on redemande
      end
    end
  end


  def self.exo_embrasser_le_mauvais(sender_id, exos_acceptation)
    #nothing here yet because I'm fucking tired of this shit
    say(sender_id, EMBRASSER[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, on envoie la piste audio
        say(sender_id, EMBRASSER[:intro]) #message 200 so it doesn't go into infinite loop
        message.reply(
          attachment: {
            type: 'audio',
            payload: {
              url: 'https://s3.eu-west-3.amazonaws.com/botmessenger/acceptation+-+Embrasser+le+mauvais+et+offrir+le+bon.mp3'
            }
          }
        )
          sleep(5.minutes)
          say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
          GeneraleExos.analyse_feedback(sender_id, Acceptation, exos_acceptation, "exo_embrasser_le_mauvais") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, exos_acceptation, Acceptation, "exo_embrasser_le_mauvais") #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) # Redirige vers l'explication brève des dimens
      else
        say(sender_id, EMBRASSER[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end
end
