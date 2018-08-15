require_relative 'textes_actions_engagees'
require_relative '../textes_introduction_hexaflex'
require_relative '../structure unique/gestion_generale_exos'
require_relative '../structure unique/textes_gestion_gen_exos'

class ActionsEngagees
  def self.exo_actions_engagees_mesure(sender_id, exos_actions_engagees)
    say(sender_id, MESURE[:ready], START_EXERCISE) # Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # Debug only
      answer = message.text.downcase
      if answer.include?("go")
        say(sender_id, MESURE[:intro])
        say(sender_id, MESURE[:actions]) # On demande les actions qu'il fait deja
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          say(sender_id, MESURE[:autres]) # On demande les actions qu'il pourrait faire
          Bot.on :message do |message|
            puts "Received '#{message.inspect}' from #{message.sender}" # debug only
            answer = message.text.downcase
            say(sender_id, MESURE[:bloqueurs]) # On demande les actions qui le bloquent dans son avancée
            Bot.on :message do |message|
              puts "Received '#{message.inspect}' from #{message.sender}" # debug only
              answer = message.text.downcase
              say(sender_id, MESURE[:fin]) # On dit de noter tout cela + on explique le but
              sleep(3)
              say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
              GeneraleExos.analyse_feedback(sender_id, ActionsEngagees, exos_actions_engagees, "exo_actions_engagees_mesure") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
            end
          end
        end
      elsif answer.include?("exo") # L'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, EXOS_ACTIONS_ENGAGEES, ActionsEngagees, "exo_actions_engagees_mesure") # Change d'exo
      elsif answer.include?("dimension") # L'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) # Redirige vers l'explication brève des dimensions
      else
        say(sender_id, MESURE[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end


  def self.exo_decoupage(sender_id, exos_actions_engagees)
    say(sender_id, DECOUPAGE[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go")
        say(sender_id, DECOUPAGE[:intro])
        say(sender_id, DECOUPAGE[:valeurs]) #on demande ses valeurs
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          say(sender_id, DECOUPAGE[:objectifs]) #on demande les objectifs généraux
          Bot.on :message do |message|
            puts "Received '#{message.inspect}' from #{message.sender}" # debug only
            answer = message.text.downcase
            say(sender_id, DECOUPAGE[:actions]) #on demande les actions ciblées
            Bot.on :message do |message|
              puts "Received '#{message.inspect}' from #{message.sender}" # debug only
              answer = message.text.downcase
              say(sender_id, DECOUPAGE[:note]) #on dit de noter ces actions + on explique le but
              sleep(3)
              say(sender_id, FEEDBACK_QUESTION, FEEDBACK) # Demande feedback
             GeneraleExos.analyse_feedback(sender_id, ActionsEngagees, exos_actions_engagees, "exo_decoupage") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
            end
          end
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, exos_actions_engagees, ActionsEngagees, "exo_decoupage") # Change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) # Redirige vers l'explication brève des dimensions
      else
        say(sender_id, DECOUPAGE[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end
end
