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
              title: 'MES EXERCICES',
              type: 'nested',
              call_to_actions: [
                {
                  title: 'Moment Présent?',
                  type: 'postback',
                  payload: 'MOMENT_PRESENT_MENU'
                },
                {
                  title: 'Défusion',
                  type: 'postback',
                  payload: 'DEFUSION_MENU'
                },
                {
                  title: 'Actions engagées',
                  type: 'postback',
                  payload: 'ACTIONS_MENU'
                },
                {
                  title: 'Acceptation',
                  type: 'postback',
                  payload: 'ACCEPTATION_MENU'
                },
                {
                  title: 'Valeurs',
                  type: 'postback',
                  payload: 'VALEURS_MENU'
                },
                {
                  title: 'Soi comme contexte',
                  type: 'postback',
                  payload: 'SOI_CONTEXTE_MENU'
                },
              ]
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
