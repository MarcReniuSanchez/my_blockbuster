# frozen_string_literal: true

require "rails_helper"

RSpec.describe Season, type: :model do
  subject { build(:season) }

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

  context "With existing season" do
    let(:season) { create(:season) }
    let(:season_with_episodes) { create(:season_with_episodes) }

    it "should return 0 if no related episode exist" do
      expect(season.episodes.count).to eq(0)
    end

    it "should return how many episodes have" do
      expect(season_with_episodes.episodes.count).to eq(2)
    end
  end

  context "With existing purchase options" do
    let(:season) { create(:season) }
    let!(:purchases) { create_list(:purchase_option, 2, media: season) }

    it "should have access to them" do
      expect(season.purchase_options.count).to eq(2)
    end

    it "should destroy them in destroy" do
      expect(PurchaseOption.count).to eq(2)
      season.destroy!
      expect(PurchaseOption.count).to eq(0)
    end
  end
end
