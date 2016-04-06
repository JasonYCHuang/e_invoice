module EInvoice
  VERSION ||= "0.2".freeze
  ONLY_WINNING_INV ||= "N".freeze
  EXPIRATION_TIMESTAMP ||= "2147483647".freeze
  URL ||= "https://www.einvoice.nat.gov.tw".freeze
  HEADER_PATH ||= "/PB2CAPIVAN/invServ/InvServ".freeze
  DETAIL_PATH ||= "/PB2CAPIVAN/invServ/InvServ".freeze
  HEADER_ACTION ||= "carrierInvChk".freeze
  DETAIL_ACTION ||= "carrierInvDetail".freeze
end
