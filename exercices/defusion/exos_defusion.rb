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

  def self.exo_chocolat_chocolat(sender_id, exos_defusion)
    say(sender_id, CHOCOLAT_CHOCOLAT[:intro]) #intro de l'exercice, chocolat lentement
    #insérer une pause
    say(sender_id, CHOCOLAT_CHOCOLAT[:intro_bis]) # bot dit ce qu'il ressent avec chocolat
    say(sender_id, CHOCOLAT_CHOCOLAT[:repetition]) #demande de répéter le mot chocolat pdt 1 minute
    #insérer une pause d'1 a 2 minutes
    say(sender_id, CHOCOLAT_CHOCOLAT[:arret_repetition])
    say(sender_id, CHOCOLAT_CHOCOLAT[:debut_repetition_souffrance]) #demande de répéter le mot qui fait souffrir pdt 1 minute
    #insérer une pause d'1 a 2 minutes
    say(sender_id, CHOCOLAT_CHOCOLAT[:fin_exercice]) #explique le but de l'exercice

  end

  def self.exo_jeu_du_mais
  end
end
