require 'facebook/messenger'
# require 'dotenv/load'
require_relative 'text'
require_relative 'methode'
include Facebook::Messenger

class StressManagement
  def self.stress_mgmt_init(sender_id)
    say(sender_id, IDIOMS[:gestion_stress], GESTION_STRESS)
    StressManagement.as_tu_deja_essaye_resoudre(sender_id)
  end

  def self.as_tu_deja_essaye_resoudre(sender_id)
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("oui") || answer.include?("moyennement")
        say(sender_id, ANS_EFFICIENCY[:good], REPONSE_TERNAIRE) # Asks whether the user method was efficient
        StressManagement.analyse_reponse_resolution_stress(sender_id)
      elsif answer.include?("moins") || answer.include?("peu")
        say(sender_id, ANS_EFFICIENCY[:good], REPONSE_TERNAIRE) # Asks whether the user method was efficient
        StressManagement.analyse_reponse_resolution_stress(sender_id)
      elsif answer.include?("non")
        say(sender_id, ANS_EFFICIENCY[:bad], PQ_INACTION) # Asks why the user method did not work to manage his stress
        StressManagement.analyse_reponse_resolution_stress(sender_id)
      else
        say(sender_id, ANS_EFFICIENCY[:unknown_command], GESTION_STRESS)
        StressManagement.as_tu_deja_essaye_resoudre(sender_id)
      end
    end
  end

  def self.analyse_reponse_resolution_stress(sender_id)
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("oui") || answer.include?("moyennement")
        say(sender_id, ANS_RESOLUTION_STRESS[:oui], RAISONS_EFFICACITE) #asks the user what helped them
        StressManagement.analyse_efficacite(sender_id)
      elsif answer.include?("moins") || answer.include?("peu")
        say(sender_id, ANS_RESOLUTION_STRESS[:moins], RAISONS_EFFICACITE) #asks the user what helped them
        StressManagement.analyse_efficacite(sender_id)
      elsif answer.include?("pas") || answer.include?("non")
        say(sender_id, ANS_RESOLUTION_STRESS[:non], RAISONS_INEFFICACITE) #asks the user why it didn't work
        StressManagement.analyse_inefficacite(sender_id)
      end
    end
  end

  def self.analyse_inefficacite(sender_id)
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("savais pas")
        say(sender_id, ANS_INEFFICIENCY[:savait_pas])
        Methode.methode_init(sender_id)
      elsif answer.include?("investi")
        say(sender_id, ANS_INEFFICIENCY[:non_investissement])
        Methode.methode_init(sender_id)
      elsif answer.include?("outil")
        say(sender_id, ANS_INEFFICIENCY[:pas_marche])
        Methode.methode_init(sender_id)
      elsif answer.include?("sais pas")
        say(sender_id, ANS_INEFFICIENCY[:dont_know])
        Methode.methode_init(sender_id)
      elsif answer.include?("methode")
        Methode.methode_init(sender_id)
      else
        say(sender_id, ANS_INEFFICIENCY[:unknown_command], RAISONS_INEFFICACITE)
        StressManagement.analyse_inefficacite(sender_id)
      end
    end
  end


  def self.analyse_efficacite(sender_id)
    Bot.on :message do |message|
      puts "Received '#{message.inspect}' from #{message.sender}" # debug only
      answer = message.text.downcase
      if answer.include?("extérieure")
        say(sender_id, ANS_WHY_EFFICIENCY[:aide_exterieure], TYPE_AIDE_EXTERIEURE)
        StressManagement.aide_exterieure(sender_id)
      elsif answer.include?("person")
        say(sender_id, ANS_WHY_EFFICIENCY[:motivation_personnelle])
        Methode.methode_init(sender_id)
      elsif answer.include?("deux")
        say(sender_id, ANS_WHY_EFFICIENCY[:both])
        Methode.methode_init(sender_id)
      elsif answer.include?("sais pas")
        say(sender_id, ANS_WHY_EFFICIENCY[:dont_know])
        Methode.methode_init(sender_id)
      elsif answer.include?("methode")
        Methode.methode_init(sender_id)
      else
        say(sender_id, ANS_WHY_EFFICIENCY[:unknown_command], RAISONS_EFFICACITE)
        StressManagement.analyse_efficacite
      end
    end
  end


  def self.aide_exterieure(sender_id)
      Bot.on :message do |message|
        puts "Received '#{message.inspect}' from #{message.sender}" # debug only
        answer = message.text.downcase
        if answer.include?("pro")
          say(sender_id, ANS_AIDE_EXTERIEURE[:aide_pro])
          Methode.methode_init(sender_id)
        elsif answer.include?("entourage")
          say(sender_id, ANS_AIDE_EXTERIEURE[:aide_entourage])
          Methode.methode_init(sender_id)
        elsif answer.include?("internet")
          say(sender_id, ANS_AIDE_EXTERIEURE[:aide_internet])
          Methode.methode_init(sender_id)
        elsif answer.include?("sais pas")
          say(sender_id, ANS_AIDE_EXTERIEURE[:dont_know])
          Methode.methode_init(sender_id)
        elsif answer.include?("methode")
          Methode.methode_init(sender_id)
        else
          say(sender_id, ANS_AIDE_EXTERIEURE[:unknown_command], TYPE_AIDE_EXTERIEURE)
          StressManagement.aide_exterieure(sender_id)
        end
      end
    end
end
