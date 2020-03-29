# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Library API", type: :request do
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:purchases) { create_list(:purchase, 4, user: user) }

  describe "GET /library/:user_id" do
    before { get "/library/#{user_id}" }

    it "returns purchased medias" do
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(4)
      expect(json_response).to match(library_expected_response)
    end
  end
end

def library_expected_response
  Purchase.not_expired.by_expiring_time.collect do |purchase|
    PurchaseSerializer.new(purchase).as_json.with_indifferent_access
  end
end
