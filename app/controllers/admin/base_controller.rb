class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :is_admin

  def is_admin
    if ! current_user.is_admin
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
