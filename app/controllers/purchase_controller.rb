# frozen_string_literal: true

class PurchaseController < ApplicationController
  def create
    user = User.find(params[:user_id])
    purchase = user.purchases.build(
      media_type: purchase_params[:media_type], media_id: purchase_params[:media_id],
      purchase_option_id: purchase_params[:purchase_option_id]
    )

    if purchase.save
      # Return OK message
      response_message = "OK: media purchased"
    else
      # Return KO message
      response_message = "KO: media already purchased"
    end
    json_response({ message: response_message })
  end

  private
    def purchase_params
      params.permit(:user_id, :media_type, :media_id, :purchase_option_id)
    end
end
