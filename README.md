# EInvoice

[![Code Climate](https://codeclimate.com/github/JasonYCHuang/e_invoice/badges/gpa.svg)](https://codeclimate.com/github/JasonYCHuang/e_invoice)
[![Coverage Status](https://coveralls.io/repos/github/JasonYCHuang/e_invoice/badge.svg?branch=master)](https://coveralls.io/github/JasonYCHuang/e_invoice?branch=master)
[![Issue Count](https://codeclimate.com/github/JasonYCHuang/e_invoice/badges/issue_count.svg)](https://codeclimate.com/github/JasonYCHuang/e_invoice)
[![Build Status](https://travis-ci.org/JasonYCHuang/e_invoice.svg?branch=master)](https://travis-ci.org/JasonYCHuang/e_invoice)
[![Dependency Status](https://gemnasium.com/JasonYCHuang/e_invoice.svg)](https://gemnasium.com/JasonYCHuang/e_invoice)


With EASYCARD number and code, you can import electronic invoice from E-invoice platform, Ministry of Finance, Taiwan.

This gem is base on the following spec, 電子發票應用API規格. (Sorry, Chinese only)

https://www.einvoice.nat.gov.tw/ein_upload/html/1428905476324.html;jsessionid=NYHKXGpX117xWMtg4LXDYnC40DGnHG5WKQ6q1bJDNCccjpln7bjG!531083587




## Installation

Add this line to your application's Gemfile:

```ruby
gem 'e_invoice'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install e_invoice

## Usage

#### 1. Generate the initializer file.

```shell
$ rails generate e_invoice
```

#### 2. Add APPID & UUID

If you use Figaro gem, you can do like this.

```ruby
# config/initailizers/e_invoice.rb
require "e_invoice"

module EInvoice
  APPID = ENV["EINV_APPID"]
  UUID = ENV["EINV_UUID"]
end
```

```ruby
# config/applicaton.yml
.
.
.
EINV_APPID: "your_secretappid"
EINV_UUID: "your_secret_uuid"
```

#### 3. Verify an EASYCARD account before adding it into your system.

```ruby
# create a variable with EASYCARD account number & encrypt.
easy_card = EInvoice::Payload.new("1K0001", card_number, card_encrypt)
# request_header to check whether this EASYCARD is a valid in the database of Ministry of Finance, Taiwan.
headers = easy_card.request_header(Time.now.strftime("%Y-%m-%d"), Time.now.strftime("%Y-%m-%d"))
# If it is valid, the following will be true. This can be used as validation.
EInvoice::Result.new(headers.response_code).success?
```

#### 4. Get E_invoice records of an EASYCARD account.

```ruby
invoices =  EInvoice::Payload.new("1K0001", easy_card.card_number, easy_card.card_encrypt)
                             .get_invoices(start_date, end_date)
# start_date can not be prior than 3 months ago.
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jasonych/e_invoice. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

