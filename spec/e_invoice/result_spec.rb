require "spec_helper"

describe EInvoice::Result do
  describe "#initialize" do
    it "initialize instance" do
      response = double(:response)
      expect(described_class.new(response).response_code).to eql response
    end
  end

  context "with success response" do
    before (:each) do
      @ok = "200"
    end

    describe "#success?" do
      it "returns true" do
        expect(described_class.new(@ok).success?).to eql true
      end
    end
  end

  context "with failure response" do
    before (:each) do
      @unauthorized = "401"
    end

    describe "#success?" do
      it "returns false" do
        expect(described_class.new(@unauthorized).success?).to eql false
      end
    end
  end
end
