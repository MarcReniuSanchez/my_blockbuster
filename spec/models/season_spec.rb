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

  context "With existing season" do
    subject { described_class.new(title: "A season", plot: "This is a season plot", number: 10) }

    let(:season) { Season.create(title: "A season", plot: "This is a season plot", number: 1) }
    let!(:episode1) { Episode.create(title: "Episode 1", plot: "Plot 1", number: 1, season: season) }
    let!(:episode2) { Episode.create(title: "Episode 2", plot: "Plot 2", number: 2, season: season) }

    it "should return 0 if no related episode exist" do
      expect(subject.episodes.count).to eq(0)
    end

    it "should return how many episodes have" do
      expect(season.episodes.count).to eq(2)
    end
  end
end
