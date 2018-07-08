class Methode
  def self.methode_init(recipient_id)
    say(recipient_id, IDIOMS[:methode], METHODE_ARTICLES)
    say(recipient_id, IDIOMS[:methode], METHODE_MOTIVE)
    Methode.es_tu_motive
  end

  def self.es_tu_motive
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      sender_id = message.sender['id']
      answer = message.text.downcase
      if answer.include?("oui")
        say(sender_id, ANS_METHODE_MOTIVE[:oui])
      elsif answer.include?("non")
        say(sender_id, ANS_METHODE_MOTIVE[:non])
      else
        say(sender_id, ANS_METHODE_MOTIVE[:unknown_command])
      end
    end
  end
end
