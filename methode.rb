require 'facebook/messenger'
require_relative 'text'
require_relative 'exercices/introduction_hexaflex'

class Methode
  def self.methode_init(sender_id)
      sleep(2)
      say(sender_id, IDIOMS[:methode])
      sleep(2)
      message_options = {
        recipient: { id: sender_id },
        message: {
          attachment:{
            type:"template",
            payload: {
              template_type:"generic",
              elements:[
                {
                  title:"La thérapie d’acceptation et d’engagement (ACT)",
                  image_url:"https://source.unsplash.com/random",
                  subtitle:"Article",
                  default_action: {
                    type: 'web_url',
                    url: "https://www.lareponsedupsy.info/therapie_acceptation_engagement",
                    webview_height_ratio: "tall",
                  },
                  buttons:[
                    {
                      type:"web_url",
                      url:"https://www.lareponsedupsy.info/therapie_acceptation_engagement",
                      title:"View Website"
                    }
                  ]
                },
                {
                  title:"Présentation brève de l’ACT par Benjamin Schoendorff",
                  image_url:"https://source.unsplash.com/random",
                  subtitle:"Video YouTube.",
                  default_action: {
                    type: 'web_url',
                    url: "https://www.youtube.com/watch?v=mJHJIGPay9I",
                    webview_height_ratio: "tall",
                  },
                  buttons:[
                    {
                      type:"web_url",
                      url:"https://www.youtube.com/watch?v=mJHJIGPay9I",
                      title:"View Website"
                    }
                  ]
                },
                {
                  title:"Les thérapies cognitives et comportementales",
                  image_url:"https://source.unsplash.com/random",
                  subtitle:"Article.",
                  default_action: {
                    type: 'web_url',
                    url: "http://www.psychologies.com/Therapies/Toutes-les-therapies/Psychotherapies/Articles-et-Dossiers/Les-therapies-cognitives-et-comportementales",
                    webview_height_ratio: "tall",
                  },
                  buttons:[
                    {
                      type:"web_url",
                      url:"http://www.psychologies.com/Therapies/Toutes-les-therapies/Psychotherapies/Articles-et-Dossiers/Les-therapies-cognitives-et-comportementales",
                      title:"View Website"
                    }
                  ]
                }
              ]
            }
          }
        }
      }
      Bot.deliver(message_options, access_token: ENV['ACCESS_TOKEN'])
      sleep(2)
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
              url: 'https://media.giphy.com/media/14udF3WUwwGMaA/giphy.gif'
            }
          }
        )
        sleep(2)
        IntroductionHexaflex.presentation_hexaflex(sender_id)
      elsif answer.include?("non")
        say(sender_id, ANS_METHODE_MOTIVE[:non])
        message.reply(
            attachment: {
              type: 'image',
              payload: {
                url: 'https://media.giphy.com/media/10tIjpzIu8fe0/giphy.gif'
              }
            }
          )
      else
        say(sender_id, IDIOMS[:unknown_command], METHODE_MOTIVE)
      end
    end
  end
end
