class EInvoiceGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  def create_initializer_file
    copy_file "e_invoice.rb", "config/initializers/e_invoice.rb"
  end
end
