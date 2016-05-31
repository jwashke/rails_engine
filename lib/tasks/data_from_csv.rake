require 'csv'

namespace :import_csv do
  task all: [
    :customers,
    :merchants,
    :invoices,
    :items,
    :transactions,
    :invoice_items
  ]


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

  task transactions: :environment do
    contents = CSV.open "db/data/transactions.csv", headers: true
    contents.each do |transaction|
      transaction = Transaction.create!(transaction.to_h)
      puts "created transaction #{transaction.id}"
    end
  end

  task items: :environment do
    items = CSV.open "db/data/items.csv", headers: true
    items.each do |item|
      item = Item.create!(item.to_h)
      puts "created item #{item.id}"
    end
  end

  task invoice_items: :environment do
    invoice_items = CSV.open "db/data/invoice_items.csv", headers: true
    invoice_items.each do |invoice_item|
      invoice_item = InvoiceItem.create!(invoice_item.to_h)
      puts "created invoice item #{invoice_item.id}"
    end
  end
end
