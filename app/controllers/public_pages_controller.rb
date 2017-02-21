class PublicPagesController < ApplicationController
  def home
  end

  def calculate
    origin = params[:origin]
    destination = params[:destination]
    
    if !origin.blank? && !destination.blank?
      @calculator = DistanceFinder::Calculator.new(origin, destination)
    else
      render :home
    end
  end
end
