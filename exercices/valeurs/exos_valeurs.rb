require_relative 'textes_valeurs'
require_relative '../gestion_generale_exos'

class Valeurs
  def self.exo_random(sender_id)
    exos_valeurs = ["exo_diner_celebration", "exo_se_remercier"]
    exercice = exos_valeurs.sample #selectionne un exercice au hasard
    if exercice == "exo_diner_celebration"
      exos_valeurs[1] = "exo_se_remercier"
     Valeurs.exo_diner_celebration(sender_id, exos_valeurs)
    elsif exercice == "exo_se_remercier"
     Valeurs.exo_se_remercier(sender_id)
    end
  end

  def self.exo_diner_celebration(sender_id, exos_valeurs)
    say(sender_id, DINER_CELEBRATION[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, affiche l'image
        say(sender_id, DINER_CELEBRATION[:intro]) #Debut de l'exercice
        message.reply( #bridget jones gif
          attachment: {
            type: 'image',
            payload: {
              url: 'https://media.giphy.com/media/S8pg2cWArWgg0/giphy.gif'
            }
          }
        )
        say(sender_id, DINER_CELEBRATION[:fete]) #Demande ce que l'utilisateur voudrait entendre a ce diner
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          say(sender_id, DINER_CELEBRATION[:reponse_valeurs]) #lui dit que ce sont ses valeurs
          say(sender_id, DINER_CELEBRATION[:note_valeurs])  #lui dit de les noter (+ il faudrait qu'on essaie de les sauvegarder)
          say(sender_id, DINER_CELEBRATION[:nouvel_exercice], NOUVEL_EXERCICE) #demande a l'utilisateur ce qu'il veut faire maintenant
          GeneraleExos.nouvel_exercice(sender_id, Valeurs, exos_valeurs, "exo_diner_celebration") #redirige vers la methode nouvel exercice
        end

      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        Valeurs.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, DINER_CELEBRATION[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end

  def self.exo_se_remercier(sender_id, exos_valeurs)
    say(sender_id, SE_REMERCIER[:ready], START_EXERCISE) #Nom de l'exercice + veux tu le faire?
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("go") #si l'utilisateur veut faire cet exo, affiche l'image
        ###### EXERCICE #######
        say(sender_id, SE_REMERCIER[:intro])
        Bot.on :message do |message|
          puts "Received '#{message.inspect}' from #{message.sender}" # debug only
          answer = message.text.downcase
          say(sender_id, SE_REMERCIER[:note]) #lui dire qu'on prend note et que ce sont ses valeurs
          say(sender_id, SE_REMERCIER[:nouvel_exercice], NOUVEL_EXERCICE) #demande a l'utilisateur ce qu'il veut faire maintenant
          GeneraleExos.nouvel_exercice(sender_id, Valeurs, exos_valeurs, "exo_se_remercier") #redirige vers la methode nouvel exercice
        end
      elsif answer.include?("exo") #l'utilisateur veut changer d'exo
        Valeurs.exo_random(sender_id) #change d'exo
      elsif answer.include?("dimension") #l'utilisateur veut changer de dimension
        IntroductionHexaflex.presentation_hexaflex(sender_id) #redirige vers l'explication des thèmes
      else
        say(sender_id, SE_REMERCIER[:unknown_command], START_EXERCISE) #pas compris, on redemande
      end
    end
  end








end
