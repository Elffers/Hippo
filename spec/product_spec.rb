require 'spec_helper'

describe Product do
  describe "validations" do
    describe "name" do
      it "must be present" do
        expect(Product.new(name: nil)).to_not be_valid
      end

      pending "must be unique" do
      end
    end

    describe "price" do
      it "must be present" do
        expect(Product.new(name: "shoes", price: nil)).to_not be_valid
      end

      # it "must not be valid if a string" do
      #   expect(Product.new(price))
      # end
    end
  end
end


# Price must be a number

# Price must be greater than 0

# Product must belong to a User