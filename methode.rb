require 'facebook/messenger'
require_relative 'text'

class Methode
  def self.methode_init(sender_id)
    say(sender_id, IDIOMS[:methode])
    say(sender_id, IDIOMS[:motive_ou_pas], METHODE_MOTIVE)
    Methode.es_tu_motive(sender_id)
  end

  def self.es_tu_motive(sender_id)
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("oui")
        say(sender_id, ANS_METHODE_MOTIVE[:oui])
          message.reply(
            attachment: {
              type: 'image',
              payload: {
                url: 'https://gph.is/Vx8pJO'
              }
            }
          )
      elsif answer.include?("non")
        say(sender_id, ANS_METHODE_MOTIVE[:non])
        message.reply(
            attachment: {
              type: 'image',
              payload: {
                url: 'https://gph.is/1LnCqDw'
              }
            }
          )
      else
        say(sender_id, ANS_METHODE_MOTIVE[:unknown_command], METHODE_MOTIVE)
      end
    end
  end
end
