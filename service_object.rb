class Service
  def self.call(*params)
    new(*params).call
  end

  class ServiceResponse
    def error?
      !success?
    end
  end

  class SuccessResponse < ServiceResponse
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def success?
      true
    end

    def [](key)
      @data[key]
    end

    def as_json
      @data.as_json
    end

    def to_s
      @data.to_s
    end
  end

  class ErrorResponse < ServiceResponse
    attr_reader :error

    def initialize(error)
      @error = error
    end

    def success?
      false
    end

    def as_json
      @error.to_s
    end

    def to_s
      @error.to_s
    end
  end
end
