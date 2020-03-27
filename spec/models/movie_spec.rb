# frozen_string_literal: true

require "rails_helper"

RSpec.describe Movie, type: :model do
  subject { described_class.new(
    title: "A movie",
    plot: "This is a movie plot"
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
end
