require_relative 'textes_valeurs'
require_relative '../../text'
require_relative '../textes_introduction_hexaflex'

require_relative '../structure unique/gestion_generale_exos'
require_relative '../structure unique/textes_gestion_gen_exos'

class Valeurs
  def self.exo_diner_celebration(sender_id, exos_valeurs)
    say(sender_id, DINER_CELEBRATION[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, affiche l'image
        say(sender_id, DINER_CELEBRATION[:intro]) #Debut de l'exercice
        sleep(2)
        message.reply( #bridget jones gif
          attachment: {
            type: 'image',
            payload: {
              url: 'https://media.giphy.com/media/S8pg2cWArWgg0/giphy.gif'
            }
          }
        )
        sleep(2)
        say(sender_id, DINER_CELEBRATION[:fete]) #Demande ce que l'utilisateur voudrait entendre a ce diner
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          say(sender_id, DINER_CELEBRATION[:reponse_valeurs]) #lui dit que ce sont ses valeurs
          sleep(3)
          say(sender_id, DINER_CELEBRATION[:note_valeurs])  #lui dit de les noter (+ il faudrait qu'on essaie de les sauvegarder)
          sleep(1)
          say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
          GeneraleExos.analyse_feedback(sender_id, Valeurs, exos_valeurs, "exo_diner_celebration") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, EXOS_VALEURS , Valeurs, "exo_diner_celebration") #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) # Redirige vers l'explication brève des dimensions
      else
        say(sender_id, IDIOMS[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end

  def self.exo_se_remercier(sender_id, exos_valeurs)
    say(sender_id, SE_REMERCIER[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo
        say(sender_id, SE_REMERCIER[:intro])
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          say(sender_id, SE_REMERCIER[:note]) #lui dire qu'on prend note et que ce sont ses valeurs
          sleep(1)
          say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
          GeneraleExos.analyse_feedback(sender_id, Valeurs, exos_valeurs, "exo_se_remercier") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, EXOS_VALEURS , Valeurs, "exo_se_remercier") #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) # Redirige vers l'explication brève des dimensions
      else
        say(sender_id, IDIOMS[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end

end
