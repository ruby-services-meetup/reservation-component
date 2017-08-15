module ReservationComponent
  module Messages
    module Commands
      class Reserve
        include Messaging::Message

        attribute :reservation_id, String
        attribute :event_id, String
        attribute :customer_id, String
        attribute :quantity, Integer
        attribute :time, String
      end
    end
  end
end
