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

  def self.exo_allumette(sender_id, exos_acceptation)
    say(sender_id, ALLUMETTE[:intro_nom], START_EXERCISE) #nom de l'exercice #demande s'il veut faire l'exercice ou changer d'exercice ou de dimension

    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, commence l'intro de l'exo
        say(sender_id, ALLUMETTE[:intro_exercice]) #commence l'intro de l'exercice
        message.reply( #gif allumette
          attachment: {
            type: 'image',
            payload: {
              url: 'https://media.giphy.com/media/l46C7JaUA0ZGW7aec/giphy.gif'
            }
          }
        )
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          say(sender_id, ALLUMETTE[:souffle]) #on dit qu'on souffle dessus. On demande ce qui se passe si c'est un building en feu
          say(sender_id, ALLUMETTE[:gros_feu])
          message.reply( #gif bob l'éponge
            attachment: {
              type: 'image',
              payload: {
                url: 'https://media.giphy.com/media/nrXif9YExO9EI/giphy.gif'
              }
            }
          )
          say(sender_id, ALLUMETTE[:explication_metaphore]) #on explique la métaphore
          say(sender_id, ALLUMETTE[:explication_part_2]) #on explique la métaphore partie 2 pour pas que ce soit trop long
          say(sender_id, ALLUMETTE[:demande_feedback], FEEDBACK) #demande feedback
          Bot.on :message do |message|
            puts "Received '#{message.inspect}' from #{message.sender}" # debug only
            answer = message.text.downcase
            if answer.include?("beaucoup") #beaucoup aimé
              say(sender_id, ANS_FEEDBACK[:beaucoup], NOUVEL_EXERCICE) #merci + demande ce que l'utilisateur veut faire
            elsif answer.include?("peu") #un peu aimé
              say(sender_id, ANS_FEEDBACK[:un_peu], NOUVEL_EXERCICE) #merci + demande ce que l'utilisateur veut faire
            elsif answer.include?("pas") #pas aimé
              say(sender_id, ANS_FEEDBACK[:pas_du_tout], NOUVEL_EXERCICE) #OK + demande ce que l'utilisateur veut faire
            end

            Bot.on :message do |message| #recupere la réponse pour nouvel exo ou pas?
              puts "Received '#{message.inspect}' from #{message.sender}" # debug only
              answer = message.text.downcase
              if answer.include?("nouvel")  #utilisateur veut faire un autre exercice
                Acceptation.exo_random(sender_id) #nouvel exercice random
              elsif answer.include?("fini")
                say(sender_id, ALLUMETTE[:au_revoir]) #pas de nouvel exercice, on dit au revoir
                message.reply( #gif buh bye
                  attachment: {
                    type: 'image',
                    payload: {
                      url: 'https://media.giphy.com/media/l0MYzLLxlJDfYtzy0/giphy.gif'
                    }
                  }
                )
              elsif answer.include?("changer") #utilisateur veut changer de dimension
                IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des exos
              else
                say(sender_id, ALLUMETTE[:nouvel_exercice], NOUVEL_EXERCICE) #pas compris, on demande ce qu'il veut faire
              end
            end
          end
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        Acceptation.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, ALLUMETTE[:intro_nom], START_EXERCISE) #pas compris, on redemande
      end
    end
  end


  def self.exo_distance_objectif(sender_id, exos_acceptation)
    #nothing here yet because I'm fucking tired of this shit

  end
end