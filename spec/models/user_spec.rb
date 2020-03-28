# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject { described_class.new(email: "random@email.com") }

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
    let(:user) { User.create(email: "random@email.com") }
    let!(:media) { Movie.create(title: "Title", plot: "Plot") }
    let(:purchase) { Purchase.create(price: 1.5, hd_quality: true, valid_until: Time.now + 2.days, user: user, media: media) }

    it "should create a new valid purchase" do
      expect(user.purchases.count).to eq(0)
      purchase
      expect(user.purchases.count).to eq(1)
    end
  end
end
