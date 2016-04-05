module EInvoice
  class Invoice
    attr_reader :response_body

    def initialize(payload)
      @payload = payload
    end

    def response_code
      @response_body["code"]
    end

    def basic_params
      {  version: EInvoice::VERSION,
         expTimeStamp: EInvoice::EXPIRATION_TIMESTAMP,
         timeStamp: Time.now.to_i + 10,
         uuid: EInvoice::UUID,
         appID: EInvoice::APPID,
         cardNo: @payload.serial,
         cardEncrypt: @payload.encrypt,
         cardType: @payload.type
       }
    end
  end
end
