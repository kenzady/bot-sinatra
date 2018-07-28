require_relative 'textes_soi'
require_relative '../gestion_generale_exos'

class Soi
  def self.exo_random(sender_id)
    exos_soi = ["exo_jeu_de_role", "exo_soi_observateur"]
    exercice = exos_soi.sample #selectionne un exercice au hasard
    if exercice == "exo_jeu_de_role"
      exos_soi[1] = "exo_soi_observateur_start"
      Soi.exo_jeu_de_role(sender_id, exos_soi)
    elsif exercice == "exo_soi_observateur"
      Soi.exo_soi_observateur(sender_id, exos_soi)
    end
  end


  def self.exo_soi_observateur(sender_id, exos_soi)
    say(sender_id, SOI_OBSERVATEUR[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, put the audio clip
        #####CLIP AUDIO########
          say(sender_id, SOI_OBSERVATEUR[:nouvel_exercice], NOUVEL_EXERCICE) #demande a l'utilisateur ce qu'il veut faire maintenant
          GeneraleExos.nouvel_exercice(sender_id, Soi, exos_soi, "exo_soi_observateur") #redirige vers la methode nouvel exercice
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        Soi.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, SOI_OBSERVATEUR[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end


  def self.exo_jeu_de_role(sender_id, exos_soi)
    #####TO DO #######
  end
end