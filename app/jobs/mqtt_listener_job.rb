class MqttListenerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ludejo_topic = 'CityHacks/Ludejo'
    MQTT::Client.connect('mqtt.labict.be') do |client|
      while true
        client.get(ludejo_topic) do |topic,message|
            
            cJson = message
            cHash = JSON.parse(cJson)
            ActionCable.server.broadcast "mqtt_message", device_message: cHash
        end
      end
    end
  end
end
