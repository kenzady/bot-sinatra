require_relative 'textes_valeurs'
require_relative '../gestion_generale_exos'

class Valeurs
  def self.exo_random(sender_id)
    exos_valeurs = ["exo_diner_celebration", "exo_se_remercier"]
    exercice = exos_valeurs.sample #selectionne un exercice au hasard
    if exercice == "exo_diner_celebration"
      exos_valeurs[1] = "exo_se_remercier"
     Valeurs.exo_diner_celebration(sender_id, exos_valeurs)
    elsif exercice == "exo_se_remercier"
     Valeurs.exo_se_remercier(sender_id)
    end
  end






end
