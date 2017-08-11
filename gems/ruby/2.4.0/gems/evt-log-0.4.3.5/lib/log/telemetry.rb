module Log::Telemetry
  class Sink
    include ::Telemetry::Sink

    record :logged
  end

  Data = Struct.new :subject_name, :message, :level, :tags, :line

  def self.sink
    Sink.new
  end

  module Register
    def register_telemetry_sink(logger)
      sink = Log::Telemetry.sink
      logger.telemetry.register sink
      sink
    end
  end
end
