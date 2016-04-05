require "spec_helper"

describe EInvoice::Duration do
  describe "#initialize" do
    before(:each) do
      @start = "2016-01-25"
      @end = "2016-04-15"
      @desired_format = [ { endpoint_begin: "2016/01/01", endpoint_end: "2016/01/31" } ,
                          { endpoint_begin: "2016/02/01", endpoint_end: "2016/02/29" } ,
                          { endpoint_begin: "2016/03/01", endpoint_end: "2016/03/31" } ,
                          { endpoint_begin: "2016/04/01", endpoint_end: "2016/04/30" } ]
    end

    it "initialize instance with correct @endpoints" do
      expect(described_class.new(@start, @end).endpoints).to eql @desired_format
    end
  end
end
