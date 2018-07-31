class PersistentMenu
  def self.enable
    # Create persistent menu
    Facebook::Messenger::Profile.set({
      persistent_menu: [
        {
          locale: 'default',
          composer_input_disabled: true,
          call_to_actions: [
            {
              title: 'Mes exercices',
              type: 'postback',
              payload: 'EXERCICES_MENU',
            },
            {
              type: 'web_url',
              title: 'Explication de la méthode',
              url: 'https://github.com/jgorset/facebook-messenger',
              webview_height_ratio: 'full'
            },
            {
              type: 'web_url',
              title: 'Explication de la méthode',
              url: 'https://github.com/jgorset/facebook-messenger',
              webview_height_ratio: 'full'
            }
          ]
        },
        {
          locale: 'zh_CN',
          composer_input_disabled: false
        }
      ]
    }, access_token: ENV['ACCESS_TOKEN'])
  end
end
