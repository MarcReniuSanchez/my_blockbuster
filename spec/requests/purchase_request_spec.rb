# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Purchase API", type: :request do
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:movie) { create(:movie_with_purchase_options) }
  let(:movie_purchase_option) { movie.purchase_options.first }
  let(:season) { create(:season_with_purchase_options) }
  let(:season_purchase_option) { season.purchase_options.first }

  describe "POST /purchase/" do
    let(:season_valid_attributes) {
      { user_id: user_id, media_type: season.type, media_id: season.id,
        purchase_option_id: season_purchase_option.id }
    }
    let(:movie_valid_attributes) {
      { user_id: user_id, media_type: movie.type, media_id: movie.id,
        purchase_option_id: movie_purchase_option.id }
    }

    context "when request is valid" do
      before { post "/purchase", params: season_valid_attributes }

      it "returns OK" do
        expect(response).not_to be_nil
        expect(response.body).to match(/OK: media purchased/)
        expect(user.purchases.count).to eq(1)
      end
    end

    context "when media has been already purchased and is not expired" do
      let!(:purchased_movie) {
        create(:purchase, user: user, media: movie, media_type: Movie.name, price: movie_purchase_option.price, hd_quality: movie_purchase_option.hd_quality)
      }
      before { post "/purchase", params: movie_valid_attributes }

      it "return KO" do
        expect(response).not_to be_nil
        expect(response.body).to match(/KO: media already purchased/)
        expect(user.purchases.count).to eq(1)
      end
    end
  end
end

#
# describe 'POST /todos/:todo_id/items' do
#     let(:valid_attributes) { { name: 'Visit Narnia', done: false } }
#
#     context 'when request attributes are valid' do
#       before { post "/todos/#{todo_id}/items", params: valid_attributes }
#
#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end
#
#     context 'when an invalid request' do
#       before { post "/todos/#{todo_id}/items", params: {} }
#
#       it 'returns status code 422' do
#         expect(response).to have_http_status(422)
#       end
#
#       it 'returns a failure message' do
#         expect(response.body).to match(/Validation failed: Name can't be blank/)
#       end
#     end
#   end
