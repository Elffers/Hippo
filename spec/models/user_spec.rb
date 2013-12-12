require 'spec_helper'

describe User do
  before do
    User.delete_all
  end 

  describe "validations" do
    let(:user){User.new(email: "blake@gmail.com")}
    it "has a valid email" do
      expect(/\w+@\w+\.\w{3}/.match(user.email).to_s).to eq user.email
    end
  
  # describe "password matches"
  # end

    describe "username" do
      it "must be present" do
        expect(User.new(name: nil, email: "name@name.com", address: "11 25th Ave Seattle, WA")).to_not be_valid
      end

      it "must be unique" do
        first_name = User.new(name: "anne", email: "name@name.com", address: "11 25th Ave Seattle, WA")
        expect(User.new(name: "anne", email: "name@name.com", address: "11 25th Ave Seattle, WA")).to_not be_valid
      end
    end

    describe "email address" do
      it "must be present" do
        expect(User.new(name: "anne", email: nil, address: "11 25th Ave Seattle, WA")).to_not be_valid
      end

      it "must be unique" do
        first_email = User.new(name: "anne", email: "name@name.com", address: "11 25th Ave Seattle, WA")

        expect(User.new(name: "anne", email: "name@name.com", address: "11 25th Ave Seattle, WA")).to_not be_valid
      end
    end

    describe "password" do
      pending "must match info in database" do
      end
    end

    describe "relationships" do
      pending "must have many products" do
      end
    end
end
