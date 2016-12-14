# frozen_string_literal: true
require "rails_helper"

feature "User sees assignment activities" do
  context "as an admin" do
  end

  private

  def create_and_login_admin
    login_as(create(:admin), scope: :user)
  end
end
