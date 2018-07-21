require_relative 'textes_introduction_hexaflex'
require_relative 'moment present/exos_moment_present'

class IntroductionHexaflex
  def self.presentation_hexaflex(sender_id) # presente rapidement le sujet et demande au user de choisir une dimension
    Bot.on :message do |message|
      say(sender_id, PRESENTATION_HEXAFLEX[:act])
      say(sender_id, PRESENTATION_HEXAFLEX[:flexibilité]) # il faudra rajouter une liste d'articles explicanr chaque branche car pour l'instant le user ne sais pas de quoi il s'agit avant de cliquer
      say(sender_id, PRESENTATION_HEXAFLEX[:question_choix_dimension], LISTE_DIMENSIONS)
      IntroductionHexaflex.analyse_choix_dimension
    end
  end

  def self.analyse_choix_dimension(sender_id) # analyse le choix de dimension du user et le renvoi à un exercice aléatoire de la dimension
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("présent")
        say(sender_id, REPONSE_CHOIX_DIM[:moment_present]) # réponse personalisée au choix de la dimension
        exercice_aleat = MomentPresent.exo_random
        MomentPresent.exercice_aleat # choisi aléatoirement un exercice de la dimension choisie
      elsif answer.include?("défusion")
        say(sender_id, REPONSE_CHOIX_DIM[:defusion])  # réponse personalisée au choix de la dimension
        exercice_aleat = Defusion.exo_random
        Defusion.exercice_aleat # choisi aléatoirement un exercice de la dimension choisie
      elsif answer.include?("acceptation")
        say(sender_id, REPONSE_CHOIX_DIM[:acceptation])
      elsif answer.include?("valeurs")
        say(sender_id, REPONSE_CHOIX_DIM[:valeurs])
      elsif answer.include?("contexte")
        say(sender_id, REPONSE_CHOIX_DIM[:soi_contexte])
      elsif answer.include?("action")
        say(sender_id, REPONSE_CHOIX_DIM[:action])
      else
        say(sender_id, ANS_EFFICIENCY[:unknown_command], GESTION_STRESS)
        IntroductionHexaflex.analyse_choix_dimension
      end
    end
  end
end
