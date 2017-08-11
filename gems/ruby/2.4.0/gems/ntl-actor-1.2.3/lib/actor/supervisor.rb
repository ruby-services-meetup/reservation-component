module Actor
  class Supervisor
    include Observable

    include Module::Dependencies
    include Module::Handler
    include Module::RunLoop

    include Messaging::Publish::Dependency

    attr_accessor :actor_count
    attr_writer :assembly_block
    attr_accessor :error
    attr_writer :thread_group

    def initialize
      @actor_count = 0
    end

    def self.build &assembly_block
      instance = new
      instance.assembly_block = assembly_block
      instance
    end

    def self.start &assembly_block
      thread = Thread.new do
        thread_group = Thread.current.group

        instance = Build.(self, &assembly_block)
        instance.run_loop
      end

      loop do
        ten_seconds = 10

        result = thread.join ten_seconds

        break unless result.nil?
      end
    end

    def configure
      self.thread_group = Thread.current.group

      Address::Put.(address)

      assembly_block.(self)

      self.publish = Messaging::Publish.build
    end

    def handle message
      result = super

      changed
      notify_observers message

      result
    end

    handle Messages::ActorStarted do |message|
      publish.register message.address

      self.actor_count += 1
    end

    handle Messages::ActorStopped do |message|
      publish.unregister message.address

      self.actor_count -= 1

      if actor_count.zero?
        send.(Messages::Stop, address)
      end
    end

    handle Messages::ActorCrashed do |message|
      self.error ||= message.error

      self.actor_count -= 1

      if actor_count.zero?
        send.(Messages::Stop, address)
      else
        send.(Messages::Shutdown, address)
      end
    end

    handle Messages::Shutdown do
      publish.(Messages::Stop)
    end

    handle Messages::Suspend do |message|
      publish.(message)
    end

    handle Messages::Resume do |message|
      publish.(message)
    end

    handle Messages::Stop do |stop|
      raise error if error

      super stop
    end

    def assembly_block
      @assembly_block ||= proc { }
    end

    def thread_group
      @thread_group ||= ThreadGroup::Default
    end

    NoActorsStarted = Class.new StandardError
  end
end
