module ReservationComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands
      include Messages::Events

      dependency :write, Messaging::Postgres::Write
      dependency :clock, Clock::UTC
      dependency :store, Store

      def configure
        Messaging::Postgres::Write.configure(self)
        Clock::UTC.configure(self)
        Store.configure(self)
      end

      category :reservation

      handle Schedule do |schedule|
        # ...

        write.(scheduled, stream_name, expected_version: version)
      end

      handle Reserve do |reserve|
        event_id = reserve.event_id

        event, version = store.fetch(event_id, include: :version)

        stream_name = stream_name(event_id)

        quantity = reserve.quantity

        unless event.available?(quantity)
          sold_out = SoldOut.follows(reserve)
          sold_out.processed_time = clock.iso8601

          write.(sold_out, stream_name, expected_version: version)

          logger.info(tag: :ignored) { "Command ignored (Command: #{reserve.message_type}, Reservation ID: #{reserve.reservation_id}, Event ID: #{event_id})" }

          return
        end

        reserved = Reserved.follow(reserve)

        reserved.processed_time = clock.iso8601

        write.(reserved, stream_name, expected_version: version)
      end
    end
  end
end
