# frozen_string_literal: true

class LibraryController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @purchases = Purchase.where(user: user).not_expired.by_expiring_time
    json_response(@purchases)
  end
end
