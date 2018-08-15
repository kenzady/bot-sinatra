require_relative 'textes_soi'

require_relative '../structure unique/gestion_generale_exos'
require_relative '../structure unique/textes_gestion_gen_exos'


class Soi
  def self.exo_soi_observateur(sender_id, exos_soi)
    say(sender_id, SOI_OBSERVATEUR[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, put the audio clip
        #####CLIP AUDIO########
        message.reply(
          attachment: {
            type: 'audio',
            payload: {
              url: 'https://s3.eu-west-3.amazonaws.com/botmessenger/Le_soi_observateur.mp3'
            }
          }
        )
          say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
          GeneraleExos.analyse_feedback(sender_id, Soi, exos_soi, "exo_soi_observateur") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, exos_soi, Soi, "exo_soi_observateur") # Change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) #  Redirige vers l'explication brève des dimensions
      else
        say(sender_id, IDIOMS[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end


  def self.exo_jeu_de_role(sender_id, exos_soi)
    say(sender_id, JEU_DE_ROLE[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo,
          say(sender_id, JEU_DE_ROLE[:intro])
          say(sender_id, JEU_DE_ROLE[:crainte])
          Bot.on :message do |message|
            puts "Received '#{message.inspect}' from #{message.sender}" # debug only
            answer = message.text.downcase
            say(sender_id, JEU_DE_ROLE[:observateur])
            Bot.on :message do |message|
              puts "Received '#{message.inspect}' from #{message.sender}" # debug only
              answer = message.text.downcase
              say(sender_id, JEU_DE_ROLE[:but])
              say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
              GeneraleExos.analyse_feedback(sender_id, Soi, exos_soi, "exo_jeu_de_role") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur

            end
          end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        Soi.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, JEU_DE_ROLE[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end
end
