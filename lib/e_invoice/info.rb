require "httpclient"

module EInvoice
  class Info < Invoice
    def initialize(payload, invoice_number, invoice_date, invoice_time)
      super(payload)
      @invoice_number = invoice_number
      @invoice_date = invoice_date
      @invoice_time = invoice_time
    end

    def request
      params = basic_params
      params[:action] = EInvoice::DETAIL_ACTION
      params[:invNum] = @invoice_number
      params[:invDate] = @invoice_date
      response = HTTPClient.new.post(EInvoice::URL + EInvoice::DETAIL_PATH, params)
      @response_body = JSON.parse(response.body)
      self
    end

    def details
      seller_name = @response_body["sellerName"]
      @response_body["details"].map do |d|
        d["seller_name"] = seller_name
        d["invoice_number"] = @invoice_number
        d["date"] = @invoice_date
        d["time"] = @invoice_time
        d
      end
    end
  end
end
