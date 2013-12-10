require 'spec_helper'

describe Product do
  describe "validations" do
    describe "name" do
      it "must be present" do
        expect(Product.new(name: nil)).to_not be_valid
      end

      it "must be unique" do
        first_dress = Product.new(name: "dress")
        expect(Product.new(name: "dress")).to_not be_valid
      end
    end

    describe "price" do
      it "must be present" do
        expect(Product.new(name: "shoes", price: nil)).to_not be_valid
      end

      it "must not be valid if a string 'money'" do
        expect(Product.new(name: "shoes", price: "money")).to_not be_valid
      end

      it "must be valid if a float 9.99" do
        expect(Product.new(name: "shoes", price: 9.99)).to be_valid
      end

      it "must be invalid if negative" do
        expect(Product.new(name: "shoes", price: -1)).to_not be_valid
      end
    end
  end
end

# Product must belong to a User