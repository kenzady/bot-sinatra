require_relative 'textes_moment_present'

class MomentPresent
  def self.exo_random
    exos_moment_present = [exo_jeu_du_detail, minuteur]
    exos_moment_present.sample
  end

  def self.exo_jeu_du_detail
  end

  def self.minuteur
  end
end
