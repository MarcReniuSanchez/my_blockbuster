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
    before { Episode.create(title: "Episode title", plot: "Episode plot", number: 1, season: season) }

    it "is not valid if another episode of same season has the same number" do
      expect(subject).to_not be_valid
    end
  end
end
