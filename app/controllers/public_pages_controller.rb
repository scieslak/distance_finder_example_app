class PublicPagesController < ApplicationController
  def home
  end

  def calculate
    @origin = params[:origin]
    @distance = "100 km"
    @time = "30 min"
  end
end
