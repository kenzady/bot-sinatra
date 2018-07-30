class PersistentMenu
  def self.enable
    # Create persistent menu
    # Facebook::Messenger::Thread.set({
    #   setting_type: 'call_to_actions',
    #   thread_state: 'existing_thread',
    #   call_to_actions: [
    #     {
    #       type: 'postback',
    #       title: 'Exercices',
    #       payload: 'EXERCISES'
    #     },
    #     {
    #       type: 'postback',
    #       title: 'Get an advice',
    #       payload: 'ADVICE'
    #     }
    #   ]
    # }, access_token: ENV['ACCESS_TOKEN'])

    Facebook::Messenger::Profile.set({
      persistent_menu: [
        {
          locale: 'default',
          composer_input_disabled: true,
          call_to_actions: [
            {
              title: 'My Account',
              type: 'nested',
              call_to_actions: [
                {
                  title: 'What is a chatbot?',
                  type: 'postback',
                  payload: 'EXTERMINATE'
                },
                {
                  title: 'History',
                  type: 'postback',
                  payload: 'HISTORY_PAYLOAD'
                },
                {
                  title: 'Contact Info',
                  type: 'postback',
                  payload: 'CONTACT_INFO_PAYLOAD'
                }
              ]
            },
            {
              type: 'web_url',
              title: 'Get some help',
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
