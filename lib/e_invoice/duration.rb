require "active_support/core_ext/time/calculations"

module EInvoice
  class Duration
    attr_reader :endpoints

    def initialize(start_date = 3.months.ago, end_date = Time.current)
      @start_date = Date.parse(start_date.to_s)
      @end_date = Date.parse(end_date.to_s)
      @endpoints = divided_by_month
    end

    private
    def divided_by_month
      month_spans = []
      pointer = @start_date.beginning_of_month
      while pointer < @end_date
        interval_begin = pointer.beginning_of_month
        interval_end = pointer.end_of_month

        month_spans << { endpoint_begin: interval_begin.strftime("%Y/%m/%d"),
                         endpoint_end: interval_end.strftime("%Y/%m/%d") }
        pointer = pointer.next_month
      end
      month_spans
    end
  end
end
