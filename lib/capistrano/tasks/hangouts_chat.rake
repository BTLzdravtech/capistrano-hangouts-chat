namespace :hangouts_chat do
  desc 'Send deployment notification to Hangouts Chat'
  task :send_message do
    run_locally do
      HangoutsChatNotifier.new(
        webhook_url: fetch(:slack_webhook_url),
        options: fetch(:slack_options, {})
      ).notify(fetch(:message, nil))
    end
  end
end

# namespace :deploy do
#   after :finishing, 'hangouts_chat:send_message'
# end
