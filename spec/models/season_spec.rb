# frozen_string_literal: true

require "rails_helper"

RSpec.describe Season, type: :model do
  subject { described_class.new(
    title: "A season",
    plot: "This is a season plot",
    number: 1
  ) }

  it "is valid with attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without title" do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without plot" do
    subject.plot = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without number" do
    subject.number = nil
    expect(subject).not_to be_valid
  end

  it "is not valid with a number lower than 1" do
    subject.number = 0
    expect(subject).not_to be_valid
  end
end
