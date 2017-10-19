FactoryGirl.define do
  factory :product do
    name "VON KAT A"
    sold_out true
    category "Lock-it Foundation"
    under_sale false
    price 1000
    sale_price 850
    sale_text "15% OFF"
  end
end
