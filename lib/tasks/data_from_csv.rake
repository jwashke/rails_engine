require 'csv'

namespace :import_csv do
  task customers: :environment do
    contents = CSV.open "db/data/customers.csv", headers: true
    contents.each do |customer|
      customer = Customer.create!(customer.to_h)
      puts "created customer #{customer.id}"
    end
  end

  task merchants: :environment do
    contents = CSV.open "db/data/merchants.csv", headers: true
    contents.each do |merchant|
      merchant = Merchant.create!(merchant.to_h)
      puts "created merchant #{merchant.id}"
    end
  end

  task invoices: :environment do
    contents = CSV.open "db/data/invoices.csv", headers: true
    contents.each do |invoice|
      invoice = Invoice.create!(invoice.to_h)
      puts "created invoice #{invoice.id}"
    end
  end
end
