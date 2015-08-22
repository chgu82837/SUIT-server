class RecommendsController < ApplicationController
  before_action :authenticate_user!

  # GET /recommends
  # GET /recommends.json
  def index
    @recommends = Recommend.retrieve(current_user.recommends.where(day: Date.today).ids)
  end
end
