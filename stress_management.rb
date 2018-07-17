require 'facebook/messenger'
# require 'dotenv/load'
require_relative 'text'
include Facebook::Messenger

class StressManagement
  def self.stress_mgmt_init(recipient_id)
    say(recipient_id, IDIOMS[:gestion_stress], GESTION_STRESS)
    StressManagement.as_tu_deja_essaye_resoudre
  end

  def self.as_tu_deja_essaye_resoudre
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      sender_id = message.sender['id']
      answer = message.text.downcase
      if answer.include?("oui") #|| answer.include?("moyennement")
        say(sender_id, ANS_EFFICIENCY[:good], REPONSE_TERNAIRE) # Asks whether the user method was efficient
        StressManagement.analyse_reponse_resolution_stress
      elsif answer.include?("moins")
        say(sender_id, ANS_EFFICIENCY[:good], REPONSE_TERNAIRE) # Asks whether the user method was efficient
        StressManagement.analyse_reponse_resolution_stress
      elsif answer.include?("non")
        say(sender_id, ANS_EFFICIENCY[:bad], PQ_INACTION) # Asks why the user method did not work to manage his stress
        StressManagement.analyse_reponse_resolution_stress
      else
        say(sender_id, ANS_EFFICIENCY[:unknown_command], GESTION_STRESS)
        StressManagement.as_tu_deja_essaye_resoudre
      end
    end
  end

  def self.analyse_reponse_resolution_stress
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      sender_id = message.sender['id']
      answer = message.text.downcase
      if answer.include?("oui") || answer.include?("moyennement")
        say(sender_id, ANS_RESOLUTION_STRESS[:oui])
      elsif answer.include?("moins")
        say(sender_id, ANS_RESOLUTION_STRESS[:moins])
      elsif answer.include?("non")
        say(sender_id, ANS_RESOLUTION_STRESS[:non])
    end
  end
end
