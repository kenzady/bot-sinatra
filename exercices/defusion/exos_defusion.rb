require_relative 'textes_defusion'
require_relative '../gestion_generale_exos'

class Defusion
  def self.exo_random(sender_id)
    exos_defusion = ["exo_chocolat_chocolat", "exo_jeu_du_mais"]
    exercice = exos_defusion.sample

    if exercice == "exo_chocolat_chocolat"
      exos_defusion[1] = "exo_jeu_du_mais"
      Defusion.exo_chocolat_chocolat(sender_id, exos_defusion)
    elsif exercice == "exo_jeu_du_mais"
      exos_defusion[1] = "exo_chocolat_chocolat"
      Defusion.exo_jeu_du_mais(sender_id, exos_defusion)
    end
  end

  def self.exo_chocolat_chocolat(sender_id, exos_defusion)
    say(sender_id, CHOCOLAT_CHOCOLAT[:intro]) #intro de l'exercice, chocolat lentement
    #insérer une pause
    say(sender_id, CHOCOLAT_CHOCOLAT[:intro_bis]) # bot dit ce qu'il ressent avec chocolat
    say(sender_id, CHOCOLAT_CHOCOLAT[:repetition]) #demande de répéter le mot chocolat pdt 1 minute
    #insérer une pause d'1 a 2 minutes
    say(sender_id, CHOCOLAT_CHOCOLAT[:arret_repetition])
    say(sender_id, CHOCOLAT_CHOCOLAT[:debut_repetition_souffrance], ANS_CHOCOLAT_CHOCOLAT) #demande de répéter le mot qui fait souffrir pdt 1 minute
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("bon")
        say(sender_id, CHOCOLAT_CHOCOLAT[:go]) #commence les 1 minutes
        #insérer une pause d'1 a 2 minutes
        say(sender_id, CHOCOLAT_CHOCOLAT[:fin_exercice]) #explique le but de l'exercice
        say(sender_id, CHOCOLAT_CHOCOLAT[:nouvel_exercice], NOUVEL_EXERCICE) #demande a l'utilisateur ce qu'il veut faire maintenant
        GeneraleExos.nouvel_exercice(sender_id, Defusion, exos_defusion, "exo_chocolat_chocolat") #redirige vers la methode nouvel exercice
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        Defusion.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, CHOCOLAT_CHOCOLAT[:unknown_command], ANS_CHOCOLAT_CHOCOLAT) #pas compris, on redemande
      end
    end
  end

  def self.exo_jeu_du_mais(sender_id, exos_defusion)
    say(sender_id, CHOCOLAT_CHOCOLAT[:intro]) #intro de l'exercice, on demande a l'utilisateur d'écrire une pensée négative
    Bot.on :message do |message| #pensée négative
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer_negative = message.text
          say(sender_id, CHOCOLAT_CHOCOLAT[:pensee_positive]) #demande la pensée positive
          Bot.on :message do |message| # pensée positive
            puts "Received '#{message.inspect}' from #{message.sender}" # debug only
            answer_positive = message.text.downcase
            #renvoyer la pensée négative + positive?
            say(sender_id, CHOCOLAT_CHOCOLAT[:explication]) #explique le but de l'exercice
          end
    end

  end

end
