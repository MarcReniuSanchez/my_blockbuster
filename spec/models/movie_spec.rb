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

  context "With existing purchase options" do
    let(:movie) { Movie.create(title: "Title", plot: "Plot") }
    let!(:purchase_option1) { PurchaseOption.create(price: 1.5, hd_quality: true, media: movie) }
    let!(:purchase_option2) { PurchaseOption.create(price: 0.5, hd_quality: false, media: movie) }

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
