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
            say(sender_id, ALLUMETTE[:quel_oeil])
          else
            say(sender_id, ALLUMETTE[:peux_mieux_faire])
          end
          say(sender_id, ALLUMETTE[:but_exercice]) #explique le but de l'exercice
          say(sender_id, ALLUMETTE[:nouvel_exercice], NOUVEL_EXERCICE) #demande a l'utilisateur ce qu'il veut faire maintenant
          GeneraleExos.nouvel_exercice(sender_id, MomentPresent, exos_moment_present, "exo_ALLUMETTE") #redirige vers la methode nouvel exercice
        end

      end
  end

end
