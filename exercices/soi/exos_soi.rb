require_relative 'textes_soi'
require_relative '../gestion_generale_exos'

class Soi
  def self.exo_random(sender_id)
    exos_soi = ["exo_jeu_de_role", "exo_observateur"]
    exercice = exos_soi.sample #selectionne un exercice au hasard
    if exercice == "exo_jeu_de_role"
      exos_soi[1] = "exo_observateur_start"
      Soi.exo_jeu_de_role(sender_id, exos_soi)
    elsif exercice == "exo_observateur"
      Soi.exo_observateur(sender_id, exos_soi)
    end
  end


  def self.exo_jeu_de_role(sender_id, exos_soi)
  end


  def self.exo_observateur(sender_id, exos_soi)
    #####EXERCICE AUDIO #######
  end
end
