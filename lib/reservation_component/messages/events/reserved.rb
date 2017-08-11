module AccountComponent
  module Messages
    module Events
      class Reserved
        include Messaging::Message

        attribute :reservation_id, String
        attribute :event_id, String
        attribute :customer_id, String
        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end
