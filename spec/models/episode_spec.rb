# frozen_string_literal: true

require "rails_helper"

RSpec.describe Episode, type: :model do
  let(:season) { Season.create(title: "Season title", plot: "Season plot", number: 1) }

  subject { described_class.new(title: "Episode title", plot: "Episode plot", number: 1, season: season) }

  it "is valid with attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without plot" do
    subject.plot = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without number" do
    subject.number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without season" do
    subject.season = nil
    expect(subject).to_not be_valid
  end

  context "With existing episodes" do
    let(:season) { Season.create(title: "A season", plot: "This is a season plot", number: 1) }
    let!(:episode1) { Episode.create(title: "Episode 1", plot: "Plot 1", number: 1, season: season) }
    let!(:episode2) { Episode.create(title: "Episode 2", plot: "Plot 2", number: 2, season: season) }

    subject { described_class.new(title: "Episode title", plot: "Episode plot", number: 1, season: season) }

    it "is not valid if another episode of same season has the same number" do
      expect(subject).to_not be_valid
    end

    it "should return the number of episodes in episode's season" do
      expect(episode1.season_episodes).to eq(2)
      expect(episode2.season_episodes).to eq(2)
    end
  end
end
