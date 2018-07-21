require_relative 'textes_moment_present'
require_relative '././text.rb'

class MomentPresent
  def self.exo_random
    exos_moment_present = [exo_jeu_du_detail, minuteur]
    exos_moment_present.sample
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
    end
  end

  # def self.minuteur(sender_id)
  # end
end
