module ReservationComponent
  module Controls
    module Events
      module Reserved
        def self.example
          open = ReservationComponent::Messages::Events::Reserved.build

          open.event_id = Account.id
          open.customer_id = Customer.id
          open.time = Controls::Time::Effective.example
          open.processed_time = Controls::Time::Processed.example

          open
        end
      end
    end
  end
end
