module EInvoice
  class Payload
    attr_reader :type, :serial, :encrypt

    def initialize(type, serial, encrypt)
      @serial = serial
      @encrypt = encrypt
      @type = type
    end

    def get_invoices(start_date, end_date)
      result = []
      month_endpoints = Duration.new(start_date, end_date).endpoints
      month_endpoints.each do |m|
        header_details = request_header(m[:endpoint_begin],
                                        m[:endpoint_end]).details
        header_details.each do |h|
          result += request_info(h).details
        end unless header_details.nil?
      end
      result
    end

    def request_header(start_date, end_date)
      Header.new(self, start_date, end_date).request
    end

    def request_info(header)
      invoice_number = header["invNum"]
      invoice_date, invoice_time = fetch_datetime(header["invDate"])
      Info.new(self, invoice_number, invoice_date, invoice_time).request
    end

    def fetch_datetime(invoice_date)
      year = (invoice_date["year"].to_i + 1911).to_s
      month = invoice_date["month"].to_s
      date = invoice_date["date"].to_s
      hours = invoice_date["hours"].to_s
      minutes = invoice_date["minutes"].to_s
      seconds = invoice_date["seconds"].to_s
      date_time = DateTime.parse(year + "/" + month + "/" + date + " " +
                                 hours + ":" + minutes + ":" + seconds)
      [date_time.strftime("%Y/%m/%d"), date_time.strftime("%H:%M:%S")]
    end
  end
end
