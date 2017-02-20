class PublicPagesController < ApplicationController
  def home
  end

  def calculate
    # require 'distance_finder'
    @calculator = DistanceFinder::Calculator.new(params[:origin], params[:destination])
  end
end
