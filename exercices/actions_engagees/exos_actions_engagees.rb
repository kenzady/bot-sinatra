require_relative 'textes_actions_engagees'
require_relative '../structure unique/gestion_generale_exos'

class ActionsEngagees
  def self.exo_random(sender_id)
    exos_actions_engagees = ["exo_decoupage", "exo_actions_engagees_mesure"]
    exercice = exos_actions_engagees.sample #selectionne un exercice au hasard
    if exercice == "exo_decoupage"
      ActionsEngagees.exo_decoupage(sender_id, exos_actions_engagees)
    elsif exercice == "exo_actions_engagees_mesure"
      ActionsEngagees.exo_actions_engagees_mesure(sender_id, exos_actions_engagees)
    end
  end


  def self.exo_actions_engagees_mesure(sender_id, exos_actions_engagees)
    say(sender_id, actions_engagees_mesure[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, put the audio clip
        #####EXERCISE TO DO ########
          say(sender_id, actions_engagees_mesure[:nouvel_exercice], NOUVEL_EXERCICE) #demande a l'utilisateur ce qu'il veut faire maintenant
          GeneraleExos.nouvel_exercice(sender_id, ActionsEngagees, exos_actions_engagees, "exo_actions_engagees_mesure") #redirige vers la methode nouvel exercice
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        ActionsEngagees.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, actions_engagees_mesure[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end


  def self.exo_decoupage(sender_id, exos_actions_engagees)
    say(sender_id, DECOUPAGE[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, put the audio clip
        #####EXERCICE TO DO ########
          say(sender_id, DECOUPAGE[:nouvel_exercice], NOUVEL_EXERCICE) #demande a l'utilisateur ce qu'il veut faire maintenant
          GeneraleExos.nouvel_exercice(sender_id, ActionsEngagees, exos_actions_engagees, "exo_decoupage") #redirige vers la methode nouvel exercice
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        ActionsEngagees.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, DECOUPAGE[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end
end
