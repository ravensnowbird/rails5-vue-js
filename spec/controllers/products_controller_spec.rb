require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: "VON KAT A",
      sold_out: true,
      category: "Lock-it Foundation",
      under_sale: false,
      price: 1000,
      sale_price: 850,
      sale_text: "15% OFF"
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      sold_out: true,
      category: "Lock-it Foundation",
      under_sale: false,
      price: 1000,
      sale_price: 850,
      sale_text: "15% OFF"
    }
  }

  describe "GET #index" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :show, params: {id: product.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :edit, params: {id: product.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: {product: valid_attributes}
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created Product" do
        post :create, params: {product: valid_attributes}
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {product: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "VON KAT AE",
          sold_out: true,
          category: "Lock-it Foundation",
          under_sale: false,
          price: 1000,
          sale_price: 850,
          sale_text: "15% OFF"
        }
      }

      it "updates the requested Product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: new_attributes}
        product.reload
        expect(product.name).to eq(new_attributes[:name])
      end

      it "redirects to the Product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: valid_attributes}
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested Product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, params: {id: product.to_param}
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the Products list" do
      product = Product.create! valid_attributes
      delete :destroy, params: {id: product.to_param}
      expect(response).to redirect_to(products_url)
    end
  end

end
