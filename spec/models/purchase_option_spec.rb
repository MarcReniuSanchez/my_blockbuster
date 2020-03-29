# frozen_string_literal: true

require "rails_helper"

RSpec.describe PurchaseOption, type: :model do
  subject { create(:purchase_option) }

  it "should be valid with attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without price" do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without media" do
    subject.media = nil
    expect(subject).not_to be_valid
  end
end
