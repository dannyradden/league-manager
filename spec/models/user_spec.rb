require 'rails_helper'

describe User do
  context "the goal is valid with necessary attributes" do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_presence_of(:role)}
  end
  context "invalid stuffs" do
    it "is invalid without name" do
      user = User.new(email: "poo@poo.com", address: "5 butt lane", phone: "555-344-2123")
    end
    it "is invalid without email" do
      user = User.new(name: "Danny", address: "5 butt lane", phone: "555-344-2123")
    end
    it "invalid with repetive email with different casing" do
      user1 = User.create(name: "Danny", email: "poo@poo.com", address: "5 butt lane", phone: "555-344-2123")

      user2 = User.new(name: "Danny", email: "poo@poo.com")
      user3 = User.new(name: "Danny", email: "POO@POO.com")

      expect(user2).to_not be_valid
      expect(user3).to_not be_valid
    end
  end
  describe "attributes" do
    it "has default role when not specified" do
      user = User.new

      expect(user.role).to eq("player")
    end

    it "responds to name, address, phone, role, email, profile_image_url" do
      user = User.new

      expect(user).to respond_to(:name, :address, :phone, :role, :email, :profile_image_url)
    end
  end
end
