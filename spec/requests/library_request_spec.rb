# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Library API", type: :request do
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:purchases) { create_list(:purchase, 4, user: user) }

  describe "GET /library/:user_id" do
    before { get "/library/#{user_id}" }

    it "returns purchased medias" do
      expect(json).not_to be_empty
      expect(json.size).to eq(4)
    end
  end
end
