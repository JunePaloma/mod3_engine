require 'csv'
  namespace :import_csv do
    desc "import customers"
    task create_customers: :environment do
      file = "db/csv/customers.csv"
      puts "You are running rake task in #{Rails.env} environment importing customers"
      CSV.foreach(file, :headers => true) do |row|
        Customer.create!(row.to_h)
      end
    end
    desc "import merchants"
    task create_merchants: :environment do
      puts "You are running rake task in #{Rails.env} environment importing merchants"
      CSV.foreach("./db/csv/merchants.csv", :headers => true) do |row|
        Merchant.create!(row.to_h)
      end
    end
    desc "import items"
    task create_items: :environment do
      puts "You are running rake task in #{Rails.env} environment importing items"
      CSV.foreach("./db/csv/items.csv", :headers => true) do |row|
        Item.create!(row.to_h)
      end
    end

    desc "import invoices"
    task create_invoices: :environtment do
      puts "You are running rake task in #{Rails.env} environment importing invoices"
      CSV.foreach("./db/csv/invoices.csv", :headers => true) do |row|
        Invoice.create!(row.to_h)
      end
    end
    desc "import transactions"
    task create_transactions: :environment do
      puts "You are running rake task in #{Rails.env} environment importing transactions"
      CSV.foreach("./db/csv/transactions.csv", :headers => true) do |row|
        Transaction.create!(row.to_h)
      end
    end
    desc "import invoice items"
    task create_invoice_items: :environemnt do
       puts "You are running rake task in #{Rails.env} environment importing invoice_items"
      CSV.foreach("./db/csv/invoice_items.csv", :headers => true) do |row|
        InvoiceItem.create!(row.to_h)
      end
    end
      desc "import data from csv's"
      task import: [:create_customers, :create_merchants, :create_invoices, :create_items, :create_invoice_items, :create_transactions]
  end
