module AccountComponent
  module Messages
    module Events
      class Scheduled
        include Messaging::Message

        attribute :event_id, String
        attribute :capacity, Integer
        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end
