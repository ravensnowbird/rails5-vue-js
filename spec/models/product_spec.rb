require 'rails_helper'

RSpec.describe Product, type: :model do
  let (:product) {FactoryGirl.create(:product)}
  context "Image url" do
    it "should retuns Product image url same as product cateogry" do
      expect(product.image_url).to eq("/assets/#{product.category}.jpg")
    end
  end
  context "Validation" do
    it "should be invalid without name" do
      product.name = nil
      expect(product.valid?).to eq(false)
    end
  end

  context "Scope" do
    it "Should return products with category if params contain cateogry" do
      expect(Product.scope({category: "Lock-it Foundation"})).to include(product)
    end
    it "Should return products within range if params contain minimum" do
      expect(Product.scope({minimum: 8})).to include(product)
    end
    it "Should return products within range if params contain maximum" do
      expect(Product.scope({maximum: 15})).to include(product)
    end
    it "Should return available products if params contain available" do
      expect(Product.scope({available: true})).not_to include(product)
    end
  end

end
