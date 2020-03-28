# frozen_string_literal: true

require "rails_helper"

RSpec.describe Purchase, type: :model do
  let(:user) { User.create(email: "user@email.com") }
  let(:media) { Movie.create(title: "Title", plot: "Plot") }

  subject { described_class.new(price: 1.5, hd_quality: true, valid_until: Time.now + 2.days, user: user, media: media) }

  it "is valid with attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without price" do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without valid until time" do
    subject.valid_until = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without user" do
    subject.user = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without media" do
    subject.media = nil
    expect(subject).not_to be_valid
  end
end
