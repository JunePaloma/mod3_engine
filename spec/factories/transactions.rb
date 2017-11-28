FactoryBot.define do
  factory :transaction do
    credit_card_number 465
    credit_card_expiration_date "2017-11-27"
    result "success"

    invoice
  end
end
