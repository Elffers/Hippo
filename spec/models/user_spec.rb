require 'spec_helper'

describe User do
  describe "validations" do
    let(:user){User.new(email: "blake@gmail.com")}
    it "has a valid email" do
      expect(/\w+@\w+\.\w{3}/.match(user.email).to_s).to eq user.email
    end
  end
  # describe "password matches"
  # end
end
