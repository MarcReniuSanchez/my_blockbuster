# frozen_string_literal: true

require "rails_helper"

RSpec.describe PurchaseOption, type: :model do
  let(:media) { Movie.create(title: "Title", plot: "Plot") }

  subject { described_class.new(price: 1.5, hd_quality: true, media: media) }

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
