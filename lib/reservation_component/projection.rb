module ReservationComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :event

    apply Scheduled do |scheduled|
      SetAttributes.(event, scheduled, copy: [
        { :event_id => :id }
      ])

      event.capacity = scheduled.capacity
    end

    apply Reserved do |reserved|
      SetAttributes.(event, reserved, copy: [
        { :event_id => :id }
      ])

      event.reserve
    end
  end
end
