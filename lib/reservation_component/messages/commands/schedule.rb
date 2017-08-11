module AccountComponent
  module Messages
    module Commands
      class Schedule
        include Messaging::Message

        attribute :event_id, String
        attribute :capacity, Integer
        attribute :time, String
      end
    end
  end
end
