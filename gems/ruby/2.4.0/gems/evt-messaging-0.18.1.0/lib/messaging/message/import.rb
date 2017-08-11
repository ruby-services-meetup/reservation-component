module Messaging
  module Message
    module Import
      Error = Class.new(RuntimeError)

      def self.call(message_data, message_class)
        raise Error unless message_class.message_type?(message_data.type)

        Transform::Read.(message_data, :message_data, message_class)
      end
    end
  end
end
