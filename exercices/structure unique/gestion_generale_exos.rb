require_relative '../introduction_hexaflex'

require_relative '../moment_present/exos_moment_present'
require_relative '../defusion/exos_defusion'
require_relative '../valeurs/exos_valeurs'
require_relative '../acceptation/exos_acceptation'
require_relative '../soi/exos_soi'
# Rajouter actions quand on le crée

require_relative 'textes_gestion_gen_exos'

# Methode except pour exclure l'exo déjà effectué de la liste des exos lorsque le user veut en faire un nouveau
class Array
  def except(value)
    self - [value]
  end
end

class GeneraleExos
  def self.exo_random(sender_id, exos_dim, dim) # exos_dim est un array d'exos
    exo_aleat = exos_dim.sample # Selectionne un exercice au hasard
    exos_dim.each do |exo| # Si l'exercice choisi aléatoirement match avec un exo de l'array d'exos, on balance l'exo en question
          arguments = [sender_id, exos_dim]
          dim.send(exo, *arguments)
    end
  end

  def self.nouvel_exercice?(sender_id, dim, exos_dim, exo_fait)
    Bot.on :message do |message| # Recupere la réponse de l'utilisateur
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("refaire")
        arguments = [sender_id, exos_dim]
        dim.send(exo_fait, *arguments)
      elsif  answer.include?("nouvel")  # Utilisateur veut faire un autre exercice
        exos_dim = exos_dim.except(exo_fait) # Exclue l'exo déjà fait
        if exos_dim == [] # Si tous les exos ont déjà été faits
          say(sender_id, NEW_EXO[:no_more_exos_available], NOUVEL_EXERCICE)
        else
        GeneraleExos.exo_random(sender_id, exos_dim, dim) # Nouvel exercice random parmi ceux non faits
        end
      elsif answer.include?("fini") # Si le user ne veut pas faire de new exo
        say(sender_id, NEW_EXO[:au_revoir]) # On dit au revoir
      elsif answer.include?("changer") # Utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) # Redirige vers l'explication des exos
      else
        say(sender_id, NEW_EXO[:unknown_command], NOUVEL_EXERCICE) # Pas compris, on redemande
        GeneraleExos.nouvel_exercice?(sender_id, MomentPresent, exos_dim, "exo_jeu_du_detail")
      end
    end
  end

  def self.analyse_feedback(sender_id, dim, exos_dim, exo_en_cours) # Demande du feedback a l'utilisateur sur l'exercice
      Bot.on :message do |message|
        puts "Received '#{message.inspect}' from #{message.sender}" # Debug only
        answer = message.text.downcase
        if answer.include?("beaucoup") # Beaucoup aimé
          say(sender_id, ANS_FEEDBACK[:beaucoup], NOUVEL_EXERCICE)
          GeneraleExos.nouvel_exercice?(sender_id, dim, exos_dim, exo_en_cours)
        elsif answer.include?("peu") # Un peu aimé
          say(sender_id, ANS_FEEDBACK[:un_peu], NOUVEL_EXERCICE)
          GeneraleExos.nouvel_exercice?(sender_id, dim, exos_dim, exo_en_cours)
        elsif answer.include?("pas") # Pas aimé
          say(sender_id, ANS_FEEDBACK[:pas_du_tout], NOUVEL_EXERCICE)
          GeneraleExos.nouvel_exercice?(sender_id, dim, exos_dim, exo_en_cours)
        else
          say(sender_id, IDIOMS[:unknown_command], FEEDBACK) # Pas compris, on redemande
        end
      end
  end
end
