class PersistentMenu
  def self.enable
    # Create persistent menu
    Facebook::Messenger::Thread.set({
      setting_type: 'call_to_actions',
      thread_state: 'existing_thread',
      call_to_actions: [
        {
          type: 'postback',
          title: 'Exercices',
          payload: 'EXERCISES'
        },
        {
          type: 'postback',
          title: 'Get an advice',
          payload: 'ADVICE'
        }
      ]
    }, access_token: ENV['ACCESS_TOKEN'])
  end
end
