class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def round_price
    (unit_price/100.0).to_s
  end
end
