require 'csv'
  namespace :import_seed do
    task create_customers: :environment do
      CSV.foreach(".db/csv/customers.csv", :headers => true) do |row|
        Customer.create!(row.to_h)
      end
    end
    task create_merchants: :environment do
      CSV.foreach("./db/csv/merchants.csv", :headers => true) do |row|
        Merchant.create!(row.to_h)
      end
    end
    task create_items: :environment do
      CSV.foreach("./db/csv/items.csv", :headers => true) do |row|
        Item.create!(row.to_h)
      end
    end
    task create_transactions: :environment do
      CSV.foreach("./db/csv/transactions.csv", :headers => true) do |row|
        Transaction.create!(row.to_h)
      end
    end
    task create_invoice_items: :environemnt do
      CSV.foreach("./db/csv/invoice_items.csv", :headers => true) do |row|
        InvoiceItem.create!(row.to_h)
      end
    end
      task import: [:create_customers, :create_merchants, :create_invoices, :create_items, :create_invoice_items, :create_transactions]
    end

   end
