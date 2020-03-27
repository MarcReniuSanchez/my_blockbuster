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
end
