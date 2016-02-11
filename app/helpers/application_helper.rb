module ApplicationHelper
  def current_customer
    current_user.customer
  end
end
