require 'spec_helper'

describe Product do
  before do
    Product.delete_all
  end

  describe "validations" do
    describe "name" do
      it "must be present" do
        expect(Product.new(
          name: nil,
          price: 9.99,
          user_id: 1,
          description: "Something you should buy",
          retired: false,
          inventory: 5)).to_not be_valid
      end

      it "must be unique" do
        first_dress = Product.new(
          name: "dress",
          price: 9.99,
          user_id: 1,
          description: "Something you should buy",
          retired: false,
          inventory: 5)
        expect(Product.new(name: "dress")).to_not be_valid
      end
    end

    describe "price" do
      it "must be present" do
        expect(Product.new(
          name: "shoes",
          price: nil,
          user_id: 1,
          description: "Something you should buy",
          retired: false,
          inventory: 5)).to_not be_valid
      end

      it "must not be valid if a string 'money'" do
        expect(Product.new(
          name: "shoes",
          price: "money",
          user_id: 1,
          description: "Something you should buy",
          retired: false,
          inventory: 5)).to_not be_valid
      end

      it "must be invalid if negative" do
        expect(Product.new(
          name: "shoes",
          price: -1,
          user_id: 1,
          description: "Something you should buy",
          retired: false,
          inventory: 5)).to_not be_valid
      end
    end

    describe "user" do
      it "must be invalid without user_id" do
        expect(Product.new(
          name: "shoes",
          price: 9.99,
          user_id: nil,
          description: "Something you should buy",
          retired: false,
          inventory: 5)).to_not be_valid
      end
    end

    describe "description" do
      it "must exist" do
        expect(Product.new(
          name: "dress",
          price: 9.99,
          user_id: 1,
          description: nil,
          retired: false,
          inventory: 5)).to_not be_valid
      end
    end

    describe "retired" do
      it "must be valid without retirement status" do
        expect(Product.new(
          name: "dress",
          price: 9.99,
          user_id: 1,
          description: "Something you should buy",
          retired: nil,
          inventory: 5)).to be_valid
      end
    end

    describe "inventory" do
      it "must be invalid with an inventory of -1" do
        expect(Product.new(
          name: "dress",
          price: 9.99,
          user_id: 1,
          description: "Something you should buy",
          retired: false,
          inventory: -1)).to_not be_valid
      end

      it "must exist" do
        expect(Product.new(
          name: "dress",
          price: 9.99,
          user_id: 1,
          description: "Something you should buy",
          retired: false,
          inventory: nil)).to_not be_valid
      end
    end
  end
end
