require_relative 'textes_moment_present'


class MomentPresent
  def self.exo_random(sender_id)
    exos_moment_present = ["exo_jeu_du_detail", "exo_minuteur"]
    exercice = exos_moment_present.sample #selectionne un exercice au hasard
    if exercice == "exo_jeu_du_detail"
      MomentPresent.exo_jeu_du_detail(sender_id)
    elsif exercice == "exo_minuteur"
      MomentPresent.exo_minuteur_start(sender_id)
    end
  end

  def self.exo_jeu_du_detail(sender_id)
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
          savane = ["zèbre", "éléphant", "girafe", "buffle", "anthilope", "lion", "oiseau", "herbe", "arbre", "rivière", "nuage", "montagne"]
          count = 0
          # Compte le nombre de bonne réponse du user et donne un encouragement en conséquence
          savane.any? do |word|
            if str.include?(word)
              count += 1
            end
          end
          if count > savane.size/2
            say(sender_id, JEU_DU_DETAIL[:quel_oeil])
          else
            say(sender_id, JEU_DU_DETAIL[:peux_mieux_faire])
          end
          say(sender_id, JEU_DU_DETAIL[:but_exercice]) #explique le but de l'exercice
          say(sender_id, JEU_DU_DETAIL[:nouvel_exercice], NOUVEL_EXERCICE) #demande a l'utilisateur ce qu'il veut faire maintenant
          MomentPresent.nouvel_exercice(sender_id) #redirige vers la methode nouvel exercice
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        MomentPresent.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, MINUTEUR[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end

  def self.exo_minuteur_start(sender_id)
    say(sender_id, MINUTEUR[:intro]) #on explique les consignes
    say(sender_id, MINUTEUR[:ready], MINUTEUR_TIME) #on demande combien de temps la personne veut attendre
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("10 minutes")
        say(sender_id, ANS_MINUTEUR[:play])
        #sleep(600) -- ici le but serait de 'pauser' pendant le nombre de secondes demandées
        MomentPresent.exo_minuteur_suite(sender_id)
      elsif answer.include?("30 minutes")
        say(sender_id, ANS_MINUTEUR[:play])
        #sleep(1800)
        MomentPresent.exo_minuteur_suite(sender_id)
      elsif answer.include?("1 heure")
        say(sender_id, ANS_MINUTEUR[:play])
        #sleep(3600)
        MomentPresent.exo_minuteur_suite(sender_id)
      elsif answer.include?("1 heure 30")
        say(sender_id, ANS_MINUTEUR[:play])
        #sleep(5400)
        MomentPresent.exo_minuteur_suite(sender_id)
      elsif answer.include?("autre")
        say(sender_id, ANS_MINUTEUR[:skip])
        MomentPresent.exo_random(sender_id)
      else
        say(sender_id, MINUTEUR[:unknown_command], MINUTEUR_TIME)
      end
    end
  end


  def self.exo_minuteur_suite(sender_id)
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
      say(sender_id, MINUTEUR[:feedback], FEEDBACK) #demande feedback
      MomentPresent.feedback(sender_id) #renvoie a la method feedback pour répondre a l'utilisateur
    end
  end

  def self.feedback(sender_id) #demande du feedback a l'utilisateur sur l'exercice
      Bot.on :message do |message|
        puts "Received '#{message.inspect}' from #{message.sender}" # debug only
        answer = message.text.downcase
        if answer.include?("beaucoup") #beaucoup aimé
          say(sender_id, ANS_FEEDBACK[:beaucoup])
          MomentPresent.exo_random(sender_id) #redirige vers un autre exercice
        elsif answer.include?("peu") #un peu aimé
          say(sender_id, ANS_FEEDBACK[:un_peu])
          MomentPresent.exo_random(sender_id)#redirige vers un autre exercice
        elsif answer.include?("pas") #pas aimé
          say(sender_id, ANS_FEEDBACK[:pas_du_tout])
          MomentPresent.exo_random(sender_id)#redirige vers un autre exercice
        else
          say(sender_id, MINUTEUR[:unknown_command], MINUTEUR[:feedback]) #pas compris, on redemande
        end
      end
  end

  def self.nouvel_exercice(sender_id)
    Bot.on :message do |message| #recupere la réponse de l'utilisateur
        puts "Received '#{message.inspect}' from #{message.sender}" # debug only
        answer = message.text.downcase
        if answer.include?("oui")  #utilisateur veut faire un autre exercice
          MomentPresent.exo_random(sender_id) #nouvel exercice random
        elsif answer.include?("non")
          say(sender_id, JEU_DU_DETAIL[:au_revoir]) #pas de nouvel exercice, on dit au revoir
        elsif answer.include?("changer") #utilisateur veut changer de dimension
          IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des exos
        else
          say(sender_id, JEU_DU_DETAIL[:nouvel_exercice], NOUVEL_EXERCICE) #pas compris, on redemande
        end
      end
  end

end
