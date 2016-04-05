module EInvoice
  class Result
    attr_reader :response_code

    def initialize(response_code = nil)
      @response_code = response_code
    end

    def success?
      !@response_code.nil? && @response_code.to_s == "200"
    end
  end
end
