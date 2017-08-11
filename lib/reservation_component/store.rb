module ReservationComponent
  class Store
    include EntityStore

    category :reservation
    entity Event
    projection Projection
    reader MessageStore::Postgres::Read
  end
end
