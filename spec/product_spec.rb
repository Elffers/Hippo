require 'spec_helper'

describe Product do
  describe "validations" do
    describe "name" do
      it "must be present" do
        expect(Product.new(name: nil, price: 9.99, user_id: 1)).to_not be_valid
      end

      it "must be unique" do
        first_dress = Product.new(name: "dress", price: 9.99, user_id: 1)
        expect(Product.new(name: "dress")).to_not be_valid
      end
    end

    describe "price" do
      it "must be present" do
        expect(Product.new(name: "shoes", price: nil, user_id: 1)).to_not be_valid
      end

      it "must not be valid if a string 'money'" do
        expect(Product.new(name: "shoes", price: "money", user_id: 1)).to_not be_valid
      end

      it "must be valid if a float 9.99" do
        expect(Product.new(name: "shoes", price: 9.99, user_id: 1)).to be_valid
      end

      it "must be invalid if negative" do
        expect(Product.new(name: "shoes", price: -1, user_id: 1)).to_not be_valid
      end
    end

    describe "user" do
      it "must be invalid without user_id" do
        expect(Product.new(name: "shoes", price: 9.99, user_id: nil)).to_not be_valid
      end
    end
  end
end