require_relative 'textes_acceptation'
require_relative '../gestion_generale_exos'

class Acceptation
  def self.exo_random(sender_id)
    exos_acceptation = ["exo_allumette", "exo_distance_objectif"]
    exercice = exos_acceptation.sample

    if exercice == "exo_allumette"
      exos_acceptation[1] = "exo_distance_objectif"
      Acceptation.exo_allumette(sender_id, exos_acceptation)
    elsif exercice == "exo_distance_objectif"
      exos_acceptation[1] = "exo_allumette"
      Acceptation.exo_distance_objectif(sender_id, exos_acceptation)
    end
  end

end
