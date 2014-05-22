class PinsController < ApplicationController
  before_action :authenticate_user!

  attr_accessor :latitude, :longitude

  def index
    @pins = Pin.all
    respond_to do |f|
        f.html 
        f.json { render :json => @pins, :only => [:longitude, :latitude]}
    end
  end

  def new
    @pin = Pin.new
  end

  def create
     @pin = Pin.new
    if @pin.save  
      respond_to do |f|
        f.html
        f.json { render :json => @pins, :only => [:longitude, :latitude]}
      end
    else
      render :index
    end
  end

private
  def pin_params
    params.require(:pin).permit(:latitude, :longitude)
  end
end
