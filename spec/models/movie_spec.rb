# frozen_string_literal: true

require "rails_helper"

RSpec.describe Movie, type: :model do
  subject { build(:movie) }

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

  context "With existing purchase options" do
    let(:movie) { create(:movie) }
    let!(:purchases) { create_list(:purchase_option, 2, media: movie) }

    it "should have access to them" do
      expect(movie.purchase_options.count).to eq(2)
    end

    it "should destroy them in destroy" do
      expect(PurchaseOption.count).to eq(2)
      movie.destroy!
      expect(PurchaseOption.count).to eq(0)
    end
  end
end
