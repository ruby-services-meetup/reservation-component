module Casing
  class Pascal
    module String
      def self.call(val, include_values: nil, symbol_to_string: nil)
        include_values = include_values.nil? ? true : include_values
        symbol_to_string ||= false

        return val unless include_values

        sym = val.is_a?(Symbol)

        converted = val
          .to_s
          .gsub(/\/(.?)/) { "::" + $1.upcase }
          .gsub(/(^|_)(.)/) { $2.upcase }

        if !symbol_to_string && sym
          converted = converted.to_sym
        end

        converted
      end
      class << self; alias :! :call; end # TODO: Remove deprecated actuator [Kelsey, Thu Oct 08 2015]
    end
  end
end
