# frozen_string_literal: true

require "rails_helper"

RSpec.describe Episode, type: :model do
  subject { build(:episode) }

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
    let(:season) { create(:season) }
    let!(:episodes) { create_list(:episode, 2, season: season) }
    let(:new_episode) { build(:episode, number: 1, season: season) }

    it "is not valid if another episode of same season has the same number" do
      expect(new_episode).to_not be_valid
    end

    it "should return the number of episodes in episode's season" do
      expect(episodes.last.season_episodes).to eq(2)
      expect(episodes.first.season_episodes).to eq(2)
    end
  end
end
