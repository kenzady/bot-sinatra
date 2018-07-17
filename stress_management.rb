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
      if answer.include?("oui") || answer.include?("moyennement")
        say(sender_id, ANS_EFFICIENCY[:good], REPONSE_TERNAIRE) # Asks whether the user method was efficient
        StressManagement.analyse_reponse_resolution_stress
      elsif answer.include?("moins") || answer.include?("peu")
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
        say(sender_id, ANS_RESOLUTION_STRESS[:oui], RAISONS_EFFICACITE) #asks the user what helped them
        StressManagement.analyse_efficacite
      elsif answer.include?("moins") || answer.include?("peu")
        say(sender_id, ANS_RESOLUTION_STRESS[:moins], RAISONS_EFFICACITE) #asks the user what helped them
        StressManagement.analyse_efficacite
      elsif answer.include?("pas") || answer.include?("non")
        say(sender_id, ANS_RESOLUTION_STRESS[:non], RAISONS_INEFFICACITE) #asks the user why it didn't work
        StressManagement.analyse_inefficacite
      end
    end
  end

  def self.analyse_inefficacite
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      sender_id = message.sender['id']
      answer = message.text.downcase
      if answer.include?("savais pas")
        say(sender_id, ANS_INEFFICIENCY[:savait_pas])
        Methode.methode_init
      elsif answer.include?("investi")
        say(sender_id, ANS_INEFFICIENCY[:non_investissement])
        Methode.methode_init
      elsif answer.include?("outil")
        say(sender_id, ANS_INEFFICIENCY[:pas_marche])
        Methode.methode_init
      elsif answer.include?("sais pas")
        say(sender_id, ANS_INEFFICIENCY[:dont_know])
        Methode.methode_init
      elsif answer.include?("methode")
        Methode.methode_init
      else
        say(sender_id, ANS_INEFFICIENCY[:unknown_command])
        StressManagement.analyse_inefficacite
      end
    end
  end


  def self.analyse_efficacite
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      sender_id = message.sender['id']
      answer = message.text.downcase
      if answer.include?("extérieure")
        say(sender_id, ANS_EFFICIENCY[:savait_pas])
        Methode.methode_init
      elsif answer.include?("personnelle")
        say(sender_id, ANS_EFFICIENCY[:non_investissement])
        Methode.methode_init
      elsif answer.include?("deux")
        say(sender_id, ANS_EFFICIENCY[:pas_marche])
        Methode.methode_init
      elsif answer.include?("sais pas")
        say(sender_id, ANS_EFFICIENCY[:dont_know])
        Methode.methode_init
      elsif answer.include?("methode")
        Methode.methode_init
      else
        say(sender_id, ANS_INEFFICIENCY[:unknown_command])
        StressManagement.analyse_inefficacite
      end
    end
  end
end
