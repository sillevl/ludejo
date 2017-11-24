Rails.application.config.after_initialize do
    MqttListenerJob.perform_later
end