module ReservationComponent
  module Controls
    module Event
      def self.example
        event = ReservationComponent::Event.build

        event.id = self.id

        event
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        1111
      end

      def self.quantity

      module New
        def self.example
          ReservationComponent::Event.build
        end
      end

      module Identified
        def self.example
          event = New.example
          event.id = Event.id
          event
        end
      end
    end
  end
end
