module ReservationComponent
  module Controls
    module Commands
      module Reserve
        def self.example
          open = ReservationComponent::Messages::Commands::Reserve.build

          open.event_id = Account.id
          open.customer_id = Customer.id
          open.quantity =
          open.time = Controls::Time::Effective.example

          open
        end
      end
    end
  end
end
