class SimpleController < ApplicationController
  def display
    @spacetimes = SpaceTime.order("start_time").all
  end
end