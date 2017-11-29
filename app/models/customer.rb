class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def name
    self.first_name + " " + self.last_name
  end
end
