require_relative '../moment_present/exos_moment_present'
require_relative '../introduction_hexaflex'
require_relative '../defusion/exos_defusion'
require_relative '../valeurs/exos_valeurs'
require_relative '../acceptation/exos_acceptation'

require_relative 'textes_gestion_gen_exos'
#methode except pour exclure l'exo déjà effectué de la liste des exos lorsque le user veut en faire un nouveau
class Array
  def except(value)
    self - [value]
  end
end

class GeneraleExos
  def self.exo_random(sender_id, exos_dim, dim) #exos_dim est un array d'exos
    exo_aleat = exos_dim.sample #selectionne un exercice au hasard
    exos_dim.each do |exo|
      if exo_aleat == exo && exo_aleat != "exo_minuteur" # Si l'exercice choisi aléatoirement match avec un exo de l'array d'exos, on balance l'exo en question
        exo = "self.#{exo}"
        dim.send(exo, sender_id)
      else
        MomentPresent.exo_minuteur_start(sender_id, exos_dim)
      end
      # Première partie du if statement ne fonctionne pas pour le moment
    end
    # if exercice == "exo_jeu_du_detail"
    #   MomentPresent.exo_jeu_du_detail(sender_id)
    # elsif exercice == "exo_minuteur"
    #   MomentPresent.exo_minuteur_start(sender_id)
    # end
  end

def self.nouvel_exercice(sender_id, dim, exos_dim, exo_fait)
  Bot.on :message do |message| # Recupere la réponse de l'utilisateur
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only
    answer = message.text.downcase
    if answer.include?("nouvel")  # Utilisateur veut faire un autre exercice
      exos_dim = exos_dim.except(exo_fait) # exclue l'exo déjà fait
      GeneraleExos.exo_random(sender_id, exos_dim, dim) #nouvel exercice random parmi ceux non faits
    elsif answer.include?("fini") # Si le user ne veut pas faire de new exo
      say(sender_id, NEW_EXO[:au_revoir]) # On dit au revoir
    elsif answer.include?("changer") # Utilisateur veut changer de dimension
      IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des exos
    else
      say(sender_id, NEW_EXO[:unknown_command], NOUVEL_EXERCICE) #pas compris, on redemande
      GeneraleExos.nouvel_exercice?(sender_id, MomentPresent, exos_dim, "exo_jeu_du_detail")
    end
  end
end

end
