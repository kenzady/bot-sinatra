require 'facebook/messenger'
require_relative '../text'

require_relative 'textes_introduction_hexaflex'

require_relative 'structure unique/gestion_generale_exos'

require_relative 'moment_present/exos_moment_present'
require_relative 'moment_present/textes_moment_present'

require_relative 'defusion/exos_defusion'
require_relative 'actions_engagees/exos_actions_engagees'
require_relative 'valeurs/exos_valeurs'
require_relative 'soi/exos_soi'
require_relative 'acceptation/exos_acceptation'

include Facebook::Messenger

class IntroductionHexaflex
  def self.presentation_hexaflex(sender_id) # presente rapidement le sujet et demande au user de choisir une dimension
      say(sender_id, PRESENTATION_HEXAFLEX[:act])
      say(sender_id, PRESENTATION_HEXAFLEX[:flexibilité]) # il faudra rajouter une liste d'articles explicanr chaque branche car pour l'instant le user ne sais pas de quoi il s'agit avant de cliquer
      # Bot.deliver(
      # {
      #   recipient:
      #   {
      #     id: sender_id
      #   },
      #   attachment:
      #   {
      #     type:"image",
      #     payload:
      #     {
      #       url:"http://www.psyris.be/wp-content/uploads/2017/03/loadimg.php_.jpeg"
      #     }
      #   },
      #   message_type: Facebook::Messenger::Bot::MessagingType::RESPONSE
      # }, access_token: ENV['ACCESS_TOKEN'])
      say(sender_id, PRESENTATION_HEXAFLEX[:question_choix_dimension], LISTE_DIMENSIONS)
      IntroductionHexaflex.analyse_choix_dimension(sender_id)
  end

  def self.analyse_choix_dimension(sender_id) # analyse le choix de dimension du user et le renvoi à un exercice aléatoire de la dimension
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("présent")
        say(sender_id, REPONSE_CHOIX_DIM[:moment_present]) # réponse personalisée au choix de la dimension
        GeneraleExos.exo_random(sender_id, EXOS_MOMENT_PRESENT, MomentPresent)
      elsif answer.include?("défusion")
        say(sender_id, REPONSE_CHOIX_DIM[:defusion])  # réponse personalisée au choix de la dimension
        GeneraleExos.exo_random(sender_id, EXOS_DEFUSION, Defusion)
      elsif answer.include?("acceptation")
        say(sender_id, REPONSE_CHOIX_DIM[:acceptation])
        GeneraleExos.exo_random(sender_id, EXOS_ACCEPTATION, Acceptation)
      elsif answer.include?("valeurs")
        say(sender_id, REPONSE_CHOIX_DIM[:valeurs])
          GeneraleExos.exo_random(sender_id, EXOS_VALEURS, Valeurs)
      elsif answer.include?("contexte")
        say(sender_id, REPONSE_CHOIX_DIM[:soi_contexte])
        GeneraleExos.exo_random(sender_id, EXOS_SOI, Soi)
      elsif answer.include?("action")
        say(sender_id, REPONSE_CHOIX_DIM[:action])
        GeneraleExos.exo_random(sender_id, EXOS_ACTIONS_ENGAGEES, ActionsEngagees)
      else
        say(sender_id, IDIOMS[:unknown_command], GESTION_STRESS)
        IntroductionHexaflex.analyse_choix_dimension
      end
    end
  end
end
