require 'facebook/messenger'
require_relative 'text'
require_relative 'exercices/introduction_hexaflex'

class Methode
  def self.methode_init(sender_id)
    say(sender_id, IDIOMS[:methode])
    # reply(
    #   attachment:{
    #   type:"template",
    #   payload:{
    #     template_type:"generic",
    #     elements:[
    #        {
    #         title:"Article 1!",
    #         image_url:"https://petersfancybrownhats.com/company_image.png",
    #         subtitle:"We have the right hat for everyone.",
    #         default_action: {
    #           type: 'web_url',
    #           url: "https://petersfancybrownhats.com/view?item=103",
    #           webview_height_ratio: "tall",
    #         },
    #         buttons:[
    #           {
    #             type:"web_url",
    #             url:"https://petersfancybrownhats.com",
    #             title:"View Website"
    #           }
    #         ]
    #       }
    #     ]
    #   }
    # }
    #   )
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
        say(sender_id, ANS_METHODE_MOTIVE[:unknown_command], METHODE_MOTIVE)
      end
    end
  end
end
