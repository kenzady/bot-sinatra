require_relative 'textes_defusion'
require_relative '../textes_introduction_hexaflex'
require_relative '../structure unique/gestion_generale_exos'
require_relative '../structure unique/textes_gestion_gen_exos'

class Defusion
  def self.exo_chocolat_chocolat(sender_id, exos_defusion)
    say(sender_id, CHOCOLAT_CHOCOLAT[:intro]) # Intro de l'exercice, chocolat lentement
    # Insérer une pause
    sleep(5)
    say(sender_id, CHOCOLAT_CHOCOLAT[:intro_bis]) # bot dit ce qu'il ressent avec chocolat
    say(sender_id, CHOCOLAT_CHOCOLAT[:repetition]) #demande de répéter le mot chocolat pdt 1 minute
    sleep(10) #should be a 1 minute break
    say(sender_id, CHOCOLAT_CHOCOLAT[:arret_repetition])
    sleep(7)
    say(sender_id, CHOCOLAT_CHOCOLAT[:debut_repetition_souffrance], ANS_CHOCOLAT_CHOCOLAT) #demande de répéter le mot qui fait souffrir pdt 1 minute
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # Debug only
      answer = message.text.downcase
      if answer.include?("bon")
        say(sender_id, CHOCOLAT_CHOCOLAT[:go]) # Commence les 1 minutes
        sleep(15) #should be a 1 minute break
        say(sender_id, CHOCOLAT_CHOCOLAT[:fin_exercice]) # Explique le but de l'exercice
        sleep(5)
        say(sender_id, FEEDBACK_QUESTION, FEEDBACK) # Demande feedback
        GeneraleExos.analyse_feedback(sender_id, Defusion, exos_defusion, "exo_chocolat_chocolat") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
      elsif answer.include?("exo") # L'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, exos_defusion, Defusion, "exo_chocolat_chocolat") # Change d'exo
      elsif answer.include?("dimension") # L'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) #  Redirige vers l'explication brève des dimensions
      else
        say(sender_id, IDIOMS[:unknown_command], ANS_CHOCOLAT_CHOCOLAT) # Pas compris, on redemande
      end
    end
  end

  def self.exo_jeu_du_mais(sender_id, exos_defusion)
    say(sender_id, JEU_DU_MAIS[:intro]) # Intro de l'exercice, on demande a l'utilisateur d'écrire une pensée négative
    Bot.on :message do |message| # Pensée négative
      puts "Received '#{message.inspect}' from #{message.sender}" # Debug only
      answer_negative = message.text
      say(sender_id, JEU_DU_MAIS[:pensee_positive]) #Demande la pensée positive
      Bot.on :message do |message| # pensée positive
        puts "Received '#{message.inspect}' from #{message.sender}" # Debug only
        answer_positive = message.text.downcase
        #renvoyer la pensée négative + positive?
        say(sender_id, JEU_DU_MAIS[:explication]) # Explique le but de l'exercice
        say(sender_id, FEEDBACK_QUESTION, FEEDBACK) # Demande feedback
        GeneraleExos.analyse_feedback(sender_id, Defusion, exos_defusion, "exo_jeu_du_mais") # Renvoie a la méthode analyse_feedback pour répondre a l'utilisateur
      end
    end
  end
end
