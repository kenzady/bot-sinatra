require_relative 'textes_moment_present'

class MomentPresent
  def self.exo_random
    exos_moment_present = ["exo_jeu_du_detail", "exo_minuteur"]
    exercice = exos_moment_present.sample

    if exercice = "exo_jeu_du_detail"
      MomentPresent.exo_jeu_du_detail(sender_id)

    elsif exercice = "exo_minuteur"
      MomentPresent.exo_minuteur(sender_id)
    end

  end

  def self.exo_jeu_du_detail(sender_id)
    say(sender_id, JEU_DU_DETAIL[:intro])
    say(sender_id, JEU_DU_DETAIL[:ready], START_EXERCISE)
    Bot.on :message do |message|
      message.reply(
        attachment: {
          type: 'image',
          payload: {
            url: 'https://data.fou-de-puzzle.com/.122/larsen-fh9-puzzle-cadre-les-animaux-de-la-savane-africaine-65-pieces--puzzle.48412-1.jpg'
          }
        }
      )
      sleep(30)
      say(sender_id, JEU_DU_DETAIL[:time_up])
      Bot.on :message do |message|
        puts "Received '#{message.inspect}' from #{message.sender}" # debug only
        say(sender_id, JEU_DU_DETAIL[:quel_oeil])
        sleep(3)
        say(sender_id, JEU_DU_DETAIL[:but_exercice])
        sleep(5)
        say(sender_id, JEU_DU_DETAIL[:nouvel_exercice])
      end
    end
  end

  def self.exo_minuteur_start(sender_id)
    say(sender_id, MINUTEUR[:intro])
    say(sender_id, MINUTEUR[:ready], MINUTEUR_TIME)
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("10 minutes")
        say(sender_id, ANS_MINUTEUR[:play])
        sleep(600)
        MomentPresent.exo_minuteur_suite(sender_id)
      elsif answer.include?("30 minutes")
        say(sender_id, ANS_MINUTEUR[:play])
        sleep(1800)
        MomentPresent.exo_minuteur_suite(sender_id)
      elsif answer.include?("1 heure")
        say(sender_id, ANS_MINUTEUR[:play])
        sleep(3600)
        MomentPresent.exo_minuteur_suite(sender_id)
      elsif answer.include?("1 heure 30")
        say(sender_id, ANS_MINUTEUR[:play])
        sleep(5400)
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
    say(sender_id, MINUTEUR[:time_up])
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      say(sender_id, MINUTEUR[:respirations])
      message.reply(
          attachment: {
            type: 'image',
            payload: {
              url: 'https://media.giphy.com/media/krP2NRkLqnKEg/giphy.gif'
            }
          }
        )
      sleep(40)
      say(sender_id, MINUTEUR[:feedback])
      MomentPresent.feedback(sender_id)
    end
  end

  def self.feedback(sender_id)
      Bot.on :message do |message|
        puts "Received '#{message.inspect}' from #{message.sender}" # debug only
        answer = message.text.downcase
        if answer.include?("beaucoup")
          say(sender_id, ANS_FEEDBACK[:beaucoup])
          MomentPresent.exo_random(sender_id)
        elsif answer.include?("peu")
          say(sender_id, ANS_FEEDBACK[:un_peu])
          MomentPresent.exo_random(sender_id)
        elsif answer.include?("pas")
          say(sender_id, ANS_FEEDBACK[:pas_du_tout])
          MomentPresent.exo_random(sender_id)
        else
          say(sender_id, MINUTEUR[:unknown_command], MINUTEUR[:feedback])
        end
      end
  end

end
