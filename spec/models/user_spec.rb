# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }

  it "is valid with email" do
    expect(subject).to be_valid
  end

  it "is not valid without email" do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it "is not valid with long emails" do
    subject.email = "anothersuperlongrandomemailfortesting@anotheremail.com"
    expect(subject).not_to be_valid
  end

  context "With purchases" do
    let(:user) { create(:user) }
    let(:purchase) { create(:purchase, user: user) }

    it "should create a new valid purchase" do
      expect(user.purchases.count).to eq(0)
      purchase
      expect(user.purchases.count).to eq(1)
    end
  end
end
