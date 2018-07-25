require_relative 'textes_defusion'

class Defusion
  def self.exo_random
    exos_defusion = ["exo_chocolat_chocolat", "exo_jeu_du_mais"]
    exercice = exos_defusion.sample

    if exercice == "exo_chocolat_chocolat"
      exos_defusion[1] = "exo_jeu_du_mais"
      Defusion.exo_chocolat_chocolat(sender_id, exos_defusion)
    elsif exercice == "exo_jeu_du_mais"
      Defusion.exo_jeu_du_mais(sender_id)
    end
  end

  def self.exo_chocolat_chocolat
  end

  def self.exo_jeu_du_mais
  end
end
