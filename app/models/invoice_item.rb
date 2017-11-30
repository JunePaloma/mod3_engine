class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  def round_price
    (unit_price/100.0).to_s
  end

  
end
