module Validate
  module Controls
    module Validator
      module Default
        def self.example
          Example.new
        end

        class Example
          module Validator
            def self.call(subject)
              true
            end
          end
        end
      end
    end
  end
end
