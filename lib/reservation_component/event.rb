module ReservationComponent
  class Event
    include Schema::DataStructure

    attribute :id, String
    attribute :capacity, Integer
    attribute :reserved_quantity, Integer

    def reserve
      quantity = 1
      self.reserved_quantity += quantity
    end

    def available_quantity
      capacity - reserved_quantity
    end

    def available?(quantity)
      available_quantity >= quantity
    end
  end
end
