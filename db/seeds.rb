categories = ["Lock-it Foundation", "Facemask", "Eye-liner"]
names = ["KAT VON D", "VON KAT A", "BON DAT C"]

10.times do
  price = (1000..2000).step(500).to_a.sample
  sale_percentage = [5, 10, 15, 20].sample
  sale_price = (price.to_f - (price.to_f * (sale_percentage.to_f/100) )).to_i
  Product.create name: names.sample,
    sold_out: [true, false].sample,
    category: categories.sample,
    under_sale: [true, false].sample,
    price: price,
    sale_price: sale_price,
    sale_text: "#{sale_percentage}% OFF"
end
