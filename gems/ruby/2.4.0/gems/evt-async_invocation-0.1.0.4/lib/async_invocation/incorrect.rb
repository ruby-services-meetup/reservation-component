module AsyncInvocation
  class Incorrect
    class Error < RuntimeError; end

    def self.method_missing(meth, *args)
      raise Error, "Incorrect invocation of async operation `#{meth}'. It does not return results. It must be called with a block argument."
    end
  end
end
