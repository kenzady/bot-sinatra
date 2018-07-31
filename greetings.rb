class Greetings
  def self.enable
    Facebook::Messenger::Profile.set({
      greeting: [
        {
          locale: 'default',
          text: 'Delphos, your hapiness provider.'
        },
        {
          locale: 'fr_FR',
          text: 'Delphos, ton fournisseur de bien-être.'
        }
      ]
    }, access_token: ENV['ACCESS_TOKEN'])

    Facebook::Messenger::Profile.set({
      get_started: {
        payload: 'GET_STARTED_PAYLOAD'
      }
    }, access_token: ENV['ACCESS_TOKEN'])
  end
end
