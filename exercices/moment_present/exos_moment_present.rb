require_relative 'textes_moment_present'
require_relative '../structure unique/gestion_generale_exos'
require_relative '../structure unique/textes_gestion_gen_exos'
require_relative '../textes_introduction_hexaflex'
require_relative '../../text'

class MomentPresent
  # EXO JEU DU DETAIL
  def self.exo_jeu_du_detail(sender_id, exos_moment_present)
    say(sender_id, JEU_DU_DETAIL[:intro]) #intro de l'exercice
    say(sender_id, JEU_DU_DETAIL[:ready], START_EXERCISE) #demande s'il veut faire l'exercice ou changer d'exercice ou de dimension
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, affiche l'image
        message.reply(
          attachment: {
            type: 'image',
            payload: {
              url: 'https://data.fou-de-puzzle.com/.122/larsen-fh9-puzzle-cadre-les-animaux-de-la-savane-africaine-65-pieces--puzzle.48412-1.jpg'
            }
          }
        )
        say(sender_id, JEU_DU_DETAIL[:time_up]) # Temps écoulé, l'utilisateur est invité à dire ce qu'il a vu
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          savane = ["zèbre", "zebre", "éléphant", "elephant" "girafe", "buffle", "antilope", "lion", "oiseau", "herbe", "arbre", "rivière", "riviere", "nuage", "montagne"]
          count = 0
          # Compte le nombre de bonne réponse du user et donne un encouragement en conséquence
          savane.each do |word|
            if answer.include?(word)
              count += 1
            end
          end
          if count > savane.size/2
            say(sender_id, JEU_DU_DETAIL[:quel_oeil])
          else
            say(sender_id, JEU_DU_DETAIL[:peux_mieux_faire])
          end
          say(sender_id, JEU_DU_DETAIL[:but_exercice]) #explique le but de l'exercice
          say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
          GeneraleExos.analyse_feedback(sender_id, MomentPresent, exos_moment_present, "exo_minuteur_start") # Renvoie a la methode analyse_feedback pour répondre a l'utilisateur
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        GeneraleExos.exo_random(sender_id, exos_moment_present, MomentPresent, "exo_jeu_du_detail") #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        say(sender_id, QUESTION_SIMPLE_DIMENSION, LISTE_DIMENSIONS)
        IntroductionHexaflex.analyse_choix_dimension(sender_id) # Redirige vers l'explication brève des dimensions
      else
        say(sender_id, IDIOMS[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end

  # EXO MINUTEUR (2 PARTS)
  def self.exo_minuteur_start(sender_id, exos_moment_present)
    say(sender_id, MINUTEUR[:intro]) #on explique les consignes
    say(sender_id, MINUTEUR[:ready], MINUTEUR_TIME) #on demande combien de temps la personne veut attendre
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("10 minutes")
        say(sender_id, ANS_MINUTEUR[:play])
        #sleep(600) -- ici le but serait de 'pauser' pendant le nombre de secondes demandées
        MomentPresent.exo_minuteur_suite(sender_id, exos_moment_present)
      elsif answer.include?("30 minutes")
        say(sender_id, ANS_MINUTEUR[:play])
        #sleep(1800)
        MomentPresent.exo_minuteur_suite(sender_id, exos_moment_present)
      elsif answer.include?("1 heure")
        say(sender_id, ANS_MINUTEUR[:play])
        #sleep(3600)
        MomentPresent.exo_minuteur_suite(sender_id, exos_moment_present)
      elsif answer.include?("1 heure 30")
        say(sender_id, ANS_MINUTEUR[:play])
        #sleep(5400)
        MomentPresent.exo_minuteur_suite(sender_id, exos_moment_present)
      elsif answer.include?("autre")
        say(sender_id, ANS_MINUTEUR[:skip])
        GeneraleExos.exo_random(sender_id, MomentPresent, exos_moment_present, "exo_minuteur_start") #nouvel exercice random parmi ceux non faits
      else
        say(sender_id, IDIOMS[:unknown_command], MINUTEUR_TIME)
      end
    end
  end

  def self.exo_minuteur_suite(sender_id, exos_moment_present)
    say(sender_id, MINUTEUR[:time_up]) #on informe l'utilisateur que le temps est écoulé et on demande ce qu'il faisait (open answer)
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      say(sender_id, MINUTEUR[:respirations]) #exercice de respiration
      message.reply( #avec gif
          attachment: {
            type: 'image',
            payload: {
              url: 'https://media.giphy.com/media/krP2NRkLqnKEg/giphy.gif'
            }
          }
        )
      #sleep(40)
      say(sender_id, FEEDBACK_QUESTION, FEEDBACK) #demande feedback
      GeneraleExos.analyse_feedback(sender_id, MomentPresent, exos_moment_present, "exo_minuteur_start") #renvoie a la method feedback pour répondre a l'utilisateur
    end
  end

end
