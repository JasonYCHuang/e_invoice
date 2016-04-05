require "httpclient"

module EInvoice
  class Header < Invoice
    def initialize(payload, start_date, end_date)
      super(payload)
      @start_date = start_date
      @end_date = end_date
      start_and_end_at_the_same_month
    end

    def request
      params = basic_params
      params[:action] = EInvoice::HEADER_ACTION
      params[:onlyWinningInv] = EInvoice::ONLY_WINNING_INV
      params[:startDate] = @start_date.tr("-", "/")
      params[:endDate] = @end_date.tr("-", "/")
      response = HTTPClient.new.post(EInvoice::URL + EInvoice::HEADER_PATH, params)
      @response_body = JSON.parse(response.body)
      self
    end

    def details
      @response_body["details"]
    end

    def start_and_end_at_the_same_month
      if DateTime.parse(@start_date).month != DateTime.parse(@end_date).month
        raise "Start_date & end_date must be the same month."
      end
    end
  end
end
